#!/usr/bin/env python
#coding=utf-8
import sys,os,logging

def set_log(log_level, log_to_console=True, log_to_file=True, file_name=None):
    logger = logging.getLogger('')
    logger.setLevel(log_level)
    formatter = logging.Formatter('[%(asctime)s] [%(levelname)s] [%(process)d:%(threadName)s] [%(module)s:%(lineno)s %(funcName)s()] %(message)s','%Y-%m-%d %H:%M:%S')
    if log_to_console:
        ch = logging.StreamHandler()
        ch.setLevel(log_level)
        ch.setFormatter(formatter)
        logger.addHandler(ch)
    if log_to_file:
        fh = logging.FileHandler(__file__+".log")
        fh.setLevel(log_level)
        fh.setFormatter(formatter)
        logger.addHandler(fh)

def add_rt_log_handler(log_level, filename):
    formatter = logging.Formatter('[%(asctime)s] [%(levelname)s] [%(process)d:%(threadName)s] [%(module)s:%(lineno)s %(funcName)s()] %(message)s','%Y-%m-%d %H:%M:%S')
    logger = logging.getLogger("")
    rt_handler = logging.handlers.TimedRotatingFileHandler(filename=filename, when='H', interval=2, backupCount=36)
    rt_handler.setFormatter(formatter)
    logger.setLevel(log_level)
    logger.addHandler(rt_handler)

