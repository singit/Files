#!/usr/bin/env python
#coding=utf-8

import sys, os, getopt
import logging
import smtplib
import common_utils 
from email.message import Message
from email.utils import formataddr

logger = logging.getLogger("")
user = "hakuaaa"
passwd = "haku090909"
smtp_server = "smtp.163.com"
smtp_port = 25
sender = "hakuaaa@163.com"

def send_mail(nick_name, receivers, subject, content):
    server = smtplib.SMTP(smtp_server, smtp_port)
    server.login(user, passwd)
    rec_list = [rec for rec in receivers.split(";") if rec.find("@") != -1]
    msg = Message()
    msg.add_header("from", formataddr((nick_name, sender)))
    for rec in rec_list:
        msg.add_header("to", rec)
    msg.add_header("subject", subject)
    msg.set_payload(content)
    logger.debug("mail:%s"%msg.as_string())
    server.sendmail(sender, rec_list, msg.as_string())
    server.close()

if __name__ == "__main__":
    common_utils.set_log(logging.INFO)
    usage = "%s -n[sender_nick_name] -r[receivers] -s[subject] -c[content]"
    opts, args = getopt.getopt(sys.argv[1:], "hn:r:s:c:")
    nick_name = ''
    subject = ''
    receivers = ''
    content = ''
    for opt, value in opts:
        if opt == "-n":
            nick_name = value
        elif opt == "-r":
            receivers = value
        elif opt == "-s":
            subject = value
        elif opt == "-c":
            content = value
    if not subject or not receivers:
        logger.error(usage)
        exit(-1)
    try:
        send_mail(nick_name, receivers, subject,content)
    except Exception as e:
        logger.error("error[%s]"%str(e))
        exit(-1)
    logger.info("succ done")
    exit(0)

