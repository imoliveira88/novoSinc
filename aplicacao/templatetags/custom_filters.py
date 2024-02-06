from django import template

register = template.Library()

@register.filter
def split_emails(emails):
    return emails.split(',')