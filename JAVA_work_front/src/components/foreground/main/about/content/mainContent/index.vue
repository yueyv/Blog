<!-- eslint-disable vue/multi-word-component-names -->
<template>
    <div class="main_content">
        <div>
            <div class="content_title">
                <h3>JAVAEE课程设计</h3>
            </div>
            <div class="content_box">
                <p><b>开发技术：<br></b><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;前端：</b>H5、css3、原生js、vue3.0、Element Plus、node.js <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>后端：</b>Java&nbsp;17、spring、servlet
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>数据库：</b>Mysql 8.0</p>
            </div>
        </div>
    </div>


</template>
<script>

    import {
        reactive,
        ref,
        toRefs,
        unref,
        onMounted
    } from 'vue'

    import axios from "axios";

    import {
        ElMessage
    } from 'element-plus'
    import {
        Delete
    } from '@element-plus/icons-vue'

    /**
     * @desc 格式化日期字符串
     * @param { Nubmer} - 时间戳
     * @returns { String } 格式化后的日期字符串
     */
    function formatDate(timestamp) {
        // 补全为13位
        let arrTimestamp = (timestamp + '').split('');
        for (let start = 0; start < 13; start++) {
            if (!arrTimestamp[start]) {
                arrTimestamp[start] = '0';
            }
        }
        timestamp = arrTimestamp.join('') * 1;
        let minute = 1000 * 60;
        let hour = minute * 60;
        let day = hour * 24;
        let month = day * 30;
        let now = new Date().getTime();
        let diffValue = now - timestamp;
        // 如果本地时间反而小于变量时间
        if (diffValue < 0) {
            return '不久前';
        }
        // 计算差异时间的量级
        let monthC = diffValue / month;
        let weekC = diffValue / (7 * day);
        let dayC = diffValue / day;
        let hourC = diffValue / hour;
        let minC = diffValue / minute;
        // 数值补0方法
        let zero = function (value) {
            if (value < 10) {
                return '0' + value;
            }
            return value;
        };
        // 使用
        if (monthC > 4) {
            // 超过1年，直接显示年月日
            return (function () {
                let date = new Date(timestamp);
                return date.getFullYear() + '年' + zero(date.getMonth() + 1) + '月' + zero(date.getDate()) + '日';
            })();
        } else if (monthC >= 1) {
            return parseInt(monthC) + '月前';
        } else if (weekC >= 1) {
            return parseInt(weekC) + '周前';
        } else if (dayC >= 1) {
            return parseInt(dayC) + '天前';
        } else if (hourC >= 1) {
            return parseInt(hourC) + '小时前';
        } else if (minC >= 1) {
            return parseInt(minC) + '分钟前';
        }
        return '刚刚';
    }

    /**
     * @desc 加载获取数据
     */
    function loadData(state) {
        state.loading = true;
        const params = {
            'currentPage': state.currentPage,
            'pageSize': state.pageSize,
        }
        axios.get("/message/pageShow", {
            params
        }).then(res => {
            // 先清空数据
            state.messageInfo = [];
            res.data.data.list.forEach(element => {
                // 时间戳格式化
                element.messageDate = formatDate(element.messageDate);
                // 头像采用qq的
                element.messageQQ = 'https://q2.qlogo.cn/headimg_dl?dst_uin=' + element.messageQQ +
                    '&spec=100'
                // 添加
                state.messageInfo.push(element)
            });
            //JSON.parse 将从后台得到的数据转换为标准JSON格式
            //前台展示的是需要数组，JSON.parse转换后的数据，element-plus可以解析
            // state.tableData = res.data.data.list;
            state.total = res.data.data.total;
            state.pageSize = res.data.data.pageSize;
            state.currentPage = res.data.data.currentPage;
            state.loading = false;
        })
    }

    export default {
        components: {
        },
        setup() {
            // 获取当前登录的用户信息
            var tokenStr = sessionStorage.getItem("userInfo");
            // 子组件的方法
            const player = ref(null);
            //挂载后加载数据
            onMounted(() => {
                loadData(state);
                if (tokenStr) {
                    state.userInfo = JSON.parse(tokenStr).data[0]
                    // 表单只读状态关闭
                    state.readonly = false
                }
            });
            const state = reactive({
                // 当前登录信息
                userInfo: {},
                // 留言内容
                message: {
                    name: '',
                    qq: '',
                    content: '',
                    code: ''
                },
                // 随机生成的验证码
                verificationCode: '',
                // 留言信息
                messageInfo: [],
                // 回复内容
                replyContent: '',
                // 回复状态
                replyId: false,
                total: 0, //总条数
                pageSize: 5, //每页显示行数
                currentPage: 1, //当前页码
                loading: false, // 加载
            })

            // 接收子组件（验证码）传的值
            const getVerificationCode = (codeList) => {
                state.verificationCode = codeList;
            };

            // 切换页面的执行事件，  val 当前页码
            const changePage = (val) => {
                state.currentPage = val;
                loadData(state);
            };

            // 发布评论
            const submit = () => {
                // 判断内容是否填写完整
                if (state.message.name == '' || state.message.qq == '' || state.message.content == '' || state
                    .message.code == '') {
                    ElMessage.error('将内容填写完整，表达你的态度再评论吧！')
                } else {
                    // 判断验证码是否输入正确
                    if (state.message.code.toLowerCase() !== state.verificationCode.toLowerCase()) {
                        ElMessage.error('验证码有误，请重新输入！')
                    } else {
                        const params = {
                            messageName: state.message.name, // 留言昵称
                            messageQQ: state.message.qq, // 留言QQ
                            content: state.message.content, // 留言内容
                        }

                        axios.post("/message/insert", params).then((res) => {
                            if (res.data.code == 0) {
                                // 清空内容
                                state.message = {
                                    name: '',
                                    qq: '',
                                    content: '',
                                    code: ''
                                }
                                // 刷新留言
                                loadData(state)
                                // 调用子组件方法（更新验证码）refreshCode
                                unref(player).refreshCode();
                                ElMessage({
                                    message: '留言成功，感谢支持.',
                                    type: 'success',
                                })
                            }
                        })
                    }
                }
            }

            // 回复留言
            const reply = (id, replyContent) => {
                // 关闭回复
                if (state.replyId === id) {
                    state.replyId = false;
                }
                // 当前留言回复没有关闭又点击其他回复时
                else if (state.replyId !== id && state.replyId !== false) {
                    state.replyId = id
                    state.replyContent = replyContent
                } else { // 为false时
                    state.replyId = id
                    state.replyContent = replyContent
                }
            }

            // 提交回复留言
            const submitReply = (messageId) => {
                if (state.replyContent !== "") {
                    axios.get("/message/updateMessageReply", {
                        params: {
                            messageId: messageId, // 回复留言id
                            replyContent: state.replyContent // 回复内容
                        }
                    }).then(res => { // 回复成功
                        if (res.data.code == 0) {
                            // 清除内容
                            state.replyContent = ""
                            state.replyId = false
                            ElMessage({
                                message: '留言回复成功.',
                                type: 'success',
                            })
                            // 刷新评论数据
                            loadData(state);
                        } else {
                            ElMessage.error('回复失败')
                        }

                    })
                } else {
                    ElMessage.error('回复内容不能为空哦~')
                }
            }

            // 删除留言
            const deleteMessage = (messageId) => {
                axios.delete("/message/delete", {
                    params: {
                        messageId: messageId
                    }
                }).then(res => { // 删除成功
                    if (res.data.code == 0) {
                        ElMessage({
                            message: '留言删除成功.',
                            type: 'success',
                        })
                        // 刷新评论数据
                        loadData(state);
                    } else {
                        ElMessage.error('删除失败')
                    }

                })
            }

            return {
                ...toRefs(state),
                getVerificationCode,
                submit,
                reply,
                deleteMessage,
                Delete,
                player,
                changePage,
                submitReply
            }
        }

    }
</script>

<style scoped>
    .main_content,
    .message_box,
    .message_content {
        width: 100%;
        height: auto;
        overflow: hidden;
        background-color: white;
        padding: 25px;
        line-height: 30px;
        color: #474749;
        border-radius: 10px;
        margin-bottom: 20px;
        box-sizing: border-box;
    }

    .message_box .titleWrapper,
    .message_content .titleWrapper {
        margin-bottom: 15px;
        margin-top: -10px;
        border-bottom: 1px solid #eee;
        overflow: hidden;
        display: flex;
        justify-content: space-between;
    }

    .message_box b,
    .message_content b {
        display: inline-block;
        border-bottom: 4px solid #2FA7B9;
    }

    .content_box {
        width: 100%;
    }

    .content_box>h4 {
        margin-left: 10px;
    }

    .content_box>p {
        text-indent: 2em;
        line-height: 35px;
    }

    .content_title>h3 {
        font-size: 20px;
        font-weight: 700;
        padding-left: 10px;
        margin: 15px 0;
        border-left: 4px solid #2FA7B9;
    }

    .message_box .el-col {
        margin-bottom: 20px;
    }

    :deep(.el-input-group__append, .el-input-group__prepend) {
        background: white;
    }

    .message_box p {
        font-size: 14px;
        color: #666;
    }

    .message_content .userInfo {
        display: inline-flex;
        justify-content: center;
        align-items: center;
    }

    .message_content .userInfo img {
        width: 40px;
        border-radius: 50px;
        margin-right: 10px;
    }

    .message_content .userInfo>font {
        font-size: 15px;
        color: #333;
    }

    .message_content .userInfo>l {
        font-size: 12px;
        color: #999;
        margin: 0 10px;
    }

    .message_content .commentGroup {
        padding: 15px;
        border-radius: 4px;
        background: #f6f6f6;
        overflow: hidden;
    }

    .message_content .detailText {
        line-height: 20px;
        font-size: 13px;
        color: #666;
    }

    .message_content .otherInfo {
        font-size: 13px;
        color: #666;
        line-height: 18px;
        margin-top: 10px;
        word-break: break-all;
    }

    .message_content .item {
        margin-bottom: 20px;
        padding-bottom: 20px;
        border-bottom: 1px dashed #eee;
    }

    .comment_reply_box {
        width: 100%;
        margin: 15px 0;
    }

    .message_content .operation {
        cursor: pointer;
        color: #777777;
        font-size: 12px;
        margin-right: 10px;
        display: inline-flex;
        justify-content: center;
        align-items: center;
    }

    .message_content .operation span{
        display: inline-flex;
        justify-content: center;
        align-items: center;
    }

    .message_content .operation .el-icon {
        margin-right: 5px;
    }

    /* 分页样式 */
    :deep(.el-pagination.is-background .el-pager li:not(.is-disabled).is-active) {
        background-color: #2fa7b9;
    }

    .el-pagination {
        margin-top: 20px;
        justify-content: center;
    }

    :deep(.el-table .cell) {
        -webkit-box-orient: vertical;
        display: -webkit-box;
        -webkit-line-clamp: 2;
    }


    @media screen and (max-width: 500px) {
        .hidePaging {
            display: none;
        }
    }

    @media screen and (min-width: 500px) {
        .showPaging {
            display: none;
        }
    }
</style>