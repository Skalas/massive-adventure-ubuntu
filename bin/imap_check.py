#!/usr/bin/env python
"""
    small script to check for unread count on imap inbox
"""
import imaplib
 
IMAPSERVER = ''
USER = ''
PASSWORD = ''
user1 =  ''
pswd1 = '' 
try:
    mail = imaplib.IMAP4_SSL(IMAPSERVER)
    mail.login(USER, PASSWORD)
    mail.select("inbox", True) # connect to inbox.
    return_code, mail_ids = mail.search(None, 'UnSeen')
    count = len(mail_ids[0].split(" "))
    #count of the second email adress
    mail = imaplib.IMAP4_SSL(IMAPSERVER)
    mail.login(user1, pswd1)
    mail.select("inbox", True) # connect to inbox.
    return_code, mail_ids = mail.search(None, 'UnSeen')
    count = count +len(mail_ids[0].split(" "))
except:
    count = 0
 
print count
