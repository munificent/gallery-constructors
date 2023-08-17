class Email({
  required final int id,
  required final String avatar,
  final String sender = '',
  final String time = '',
  final String subject = '',
  final String message = '',
  final String recipients = '',
  final bool containsPictures = false,
});

class InboxEmail({
  required super.id,
  required super.sender,
  super.time,
  super.subject,
  super.message,
  required super.avatar,
  super.recipients,
  super.containsPictures,
  InboxType inboxType; = InboxType.normal,
}) extends Email;

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
