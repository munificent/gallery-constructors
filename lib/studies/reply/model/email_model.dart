class Email {
  new ({
    required final int this.id,
    required final String this.avatar,
    final String this.sender = '',
    final String this.time = '',
    final String this.subject = '',
    final String this.message = '',
    final String this.recipients = '',
    final bool this.containsPictures = false,
  });
}

class InboxEmail extends Email {
  new ({
    required super.id,
    required super.sender,
    super.time,
    super.subject,
    super.message,
    required super.avatar,
    super.recipients,
    super.containsPictures,
    InboxType this.inboxType = InboxType.normal,
  });
}

// The different mailbox pages that the Reply app contains.
enum MailboxPageType {
  inbox,
  starred,
  sent,
  trash,
  spam,
  drafts,
}

// Different types of mail that can be sent to the inbox.
enum InboxType {
  normal,
  spam,
}
