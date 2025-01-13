///FOR API Usage
enum BookingStatus {
  CANCELLED,
  PAYMENT_PENDING,
  RESERVED,
  CONFIRMED,
  PAYMENT_FAILED
}

enum AuthPages {
  landing,
  login,
  register,
}

enum PaymentStatus { SUCCESS, PENDING, FAILED, REFUNDED }

enum SearchType {
  SHORT,
  LONG,
}

enum AppLocale {
  english,
  chinese,
}

enum NotificationsType {
  Bookings_Notification,
  Welcome_Message,
  News_Notification,
  Feedback_Notification,
}

enum AppButtonsType {
  Allow_Home_Scrolling,
}

enum NewsFeedType { PROMOTION, EVENT, OTHERS }

enum UserType { OWNER, TENANT, ALL, LOADING }

//For App Logic Usage
enum UserStatusType {
  newUser,
  existingUser,
  verifiedUser,
  unverifiedUser,
  inCompleteProfileUser,
}

enum FeedbackType { management, property, booking, payment, withdrawal, other }

enum DateAvailableStatus { AVAILABLE, OCCUPIED, RESERVED, NOT_AVAILABLE }

enum UnitListingType {
  totalRevenue,
  withdraw,
  outstanding,
}

enum PageViewType {
  homePage,
  feedbackPage,
  myBookingPage,
  myPropertyPage,
  newsPage,
  profilePage,
}
