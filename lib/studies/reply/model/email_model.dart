class Email {
  // If "default" also added optional parameters with default values for any
  // field that had an initializer at its declaration, then these default values
  // could all be moved to the field declarations and removed from here.
  default Email({
    this.sender = '',
    this.time = '',
    this.subject = '',
    this.message = '',
    this.recipients = '',
    this.containsPictures = false,
  });

  final int id;
  final String sender;
  final String time;
  final String subject;
  final String message;
  final String avatar;
  final String recipients;
  final bool containsPictures;
}

class InboxEmail extends Email {
  InboxType inboxType;
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
