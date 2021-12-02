import 'package:flutter/widgets.dart';

class Translations {
  Translations(this.locale);

  final Locale locale;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Title',
      'signup': 'Sign Up',
      'forgetpass': 'Forget Password',
      'change_language': 'Change language',
      'signin': 'Sign In',
      'username': 'User Name',
      'password': 'Password',
      'welcomee': 'Welcome',
      'plumbing': 'Plumbing',
      'Home_Cleaning': 'Home Cleaning',
      'repairs': 'Repairs',
      'home_painting': 'Home Painting',
      'electrican': 'Electrican',
      'lunder': 'Launder',
      'covid': 'Covid-Sanitization',
      'moving_home': 'Moving Home',
      'plumbing_des':
          'Plumbing services is the whole system of piping, fixtures, applications for providing water supply or drainage to the buildings with the use of pipes, control valves, pipe layouts, storage tanks, etc',
      'plumbing_mot': 'Get yourself a plumbing service! ',
      'pick_Service': 'Pick!',
      'cleaning_home_des': 'Cleaning service',
      'cleaning_home_motv': 'Get your home our cleaning service! ',
      'cleaning_painting_des': 'Home Painting service',
      'cleaning_painting_motv': 'Get your home our Painting service! ',
      'electrican_des': 'For all kind of Electrical for you home ',
      'electrican_motv': 'Pick Your Electrican now',
      'repier_des': 'For all kind of repiers ',
      'repier_motv': 'Fix up everything !',
      'lunder_des': 'Lundering ',
      'lunder_motv': 'Clean you clothes ! ',
      'suggested_work': 'Suggested Worker',
      'create_account': 'Create Account',
      'signup_worker': 'Sign Up As Worker',
      'signup_coustmer': 'Sign Up As Coustmer',
      'email': 'Email',
      'phonenumber': 'Phone Number',
      'first_name': 'First Name',
      'last_name': 'Last Name',
      'descprtion': 'Descrption',
      'upload_image': 'Upload Image',
      'Categorey': 'Category',
      'city': 'City',
      'talk_about_your_self': 'Talk About Yourself',
      'jobs_done': 'Jobs Done',
      'Rating': 'Rating',
      'about_me': 'About me',
      'schedule': 'Shcedule',
      'Reviews': 'Reviews',
      'Client': 'Client',
      'Home': 'Home',
      'Booking': 'Booking',
      'profile': 'profile',
      'Post': 'Post',
      'myprofile': 'My Profile',
      'Notfication': 'Notfication',
      'Languages': 'Languages',
      'Arabic': 'Arabic',
      'English': 'English',
      'addworkpic': 'Add Work Picture',
      'editmycategory': 'Edit My Categorey',
      'done': 'Done',
      'takethisjob': 'Take This Job',
      'cancel': 'Cancel',
      'Save': 'Save',
      'editmyprofiel': 'Edit My Profile',
      'fullname': 'Full Name',
    },
    'ar': {
      'title': 'عنوان',
      'signup': 'تسجيل',
      'forgetpass': 'نسيت كلمة المرور ',
      'change_language': 'تبديل اللغة',
      'signin': 'تسجيل الدخول',
      'username': 'اسم المستخدم ',
      'password': 'كلمة المرور ',
      'welcomee': 'مرحبا بك ',
      'Home_Cleaning': 'تنظيف المنزل',
      'repairs': 'إصلاحات',
      'home_painting': 'دهان المنزل',
      'electrican': 'كهربائي ',
      'lunder': 'الغسيل',
      'covid': 'تنظيف و التعقيم',
      'moving_home': 'نقل مفروشات ',
      'plumbing': 'سباك',
      'plumbing_des':
          'خدمات السباكة هي النظام الكامل للأنابيب والتركيبات والتطبيقات لتوفير إمدادات المياه أو الصرف الصحي للمباني باستخدام الأنابيب وصمامات التحكم وتصميمات الأنابيب وخزانات التخزين وغيرها',
      'plumbing_mot': 'احصل على خدمة السباكة! ',
      'pick_Service': 'أختار!',
      'cleaning_home_des': 'خدمة التنظيف ',
      'cleaning_home_motv': 'احصل على منزلك خدمة التنظيف لدينا!',
      'cleaning_painting_des': 'خدمة دهان المنزل',
      'cleaning_painting_motv': 'ادهن بيتك الأن ',
      'electrican_des': 'كهربائي لجميع ادوات المنزل !',
      'electrican_motv': 'اصلح الكهرباء في بيتك ',
      'repier_des': 'لاصلاح جميع الادوات ',
      'repier_motv': 'اصلح كل شيئ !',
      'lunder_des': 'الغسيل !  ',
      'lunder_motv': 'اغسل ثيابك ! ',
      'suggested_work': 'العمال المقترحين ',
      'create_account': 'انشاء حساب ',
      'signup_worker': 'سجل حسابك كعامل ',
      'signup_coustmer': 'سجل حسابك كمستخدم',
      'email': 'البريد الالكتروني',
      'phonenumber': 'رقم المحمول',
      'first_name': 'الاسم الاول',
      'last_name': 'الاسم الاخير',
      'descprtion': 'اشرح عن نفسك',
      'upload_image': 'إدراج صورة',
      'Categorey': 'التصنيفات',
      'city': 'المدينة',
      'talk_about_your_self': 'تكلم عن نفسك',
      'jobs_done': 'الاعمال المنجزة',
      'Rating': 'التقييمات ',
      'about_me': 'السيرة الذاتية ',
      'schedule': 'احجز موعد',
      'Reviews': 'المراجعات ',
      'Client': 'العميل',
      'Home': 'الصفحة الرئيسية',
      'Booking': 'الحجز',
      'profile': 'الملف الشخصي',
      'Post': 'نشر',
      'myprofile': 'ملفي الشخصي',
      'Notfication': 'الاشعارات',
      'Languages': 'اللغات ',
      'Arabic': 'اللغة العربية',
      'English': 'اللغة الانجليزية',
      'addworkpic': 'اضافة صور عملك',
      'editmycategory': 'تعديل التصنيفات',
      'done': 'الانتهاء',
      'takethisjob': 'تقدم ل عرض العمل',
      'cancel': 'الغاء',
      'Save': 'حفظ',
      'editmyprofiel': 'تعديل ملفي الشخصي',
      'fullname':'الاسم الكامل '
    },
  };
  String get fullname {
    return _localizedValues[locale.languageCode]['fullname'];
  }
  String get editmyprofile {
    return _localizedValues[locale.languageCode]['editmyprofiel'];
  }

  String get addworkpic {
    return _localizedValues[locale.languageCode]['addworkpic'];
  }

  String get editmycategory {
    return _localizedValues[locale.languageCode]['editmycategory'];
  }

  String get done {
    return _localizedValues[locale.languageCode]['done'];
  }

  String get cancel {
    return _localizedValues[locale.languageCode]['cancel'];
  }

  String get save {
    return _localizedValues[locale.languageCode]['Save'];
  }

  String get takethisjob {
    return _localizedValues[locale.languageCode]['takethisjob'];
  }

  String get myprofile {
    return _localizedValues[locale.languageCode]['myprofile'];
  }

  String get notfication {
    return _localizedValues[locale.languageCode]['Notfication'];
  }

  String get languages {
    return _localizedValues[locale.languageCode]['Languages'];
  }

  String get arabic {
    return _localizedValues[locale.languageCode]['Arabic'];
  }

  String get english {
    return _localizedValues[locale.languageCode]['English'];
  }

  String get home {
    return _localizedValues[locale.languageCode]['Home'];
  }

  String get booking {
    return _localizedValues[locale.languageCode]['Booking'];
  }

  String get profile {
    return _localizedValues[locale.languageCode]['profile'];
  }

  String get post {
    return _localizedValues[locale.languageCode]['Post'];
  }

  String get jobsdone {
    return _localizedValues[locale.languageCode]['jobs_done'];
  }

  String get rating {
    return _localizedValues[locale.languageCode]['Rating'];
  }

  String get aboutme {
    return _localizedValues[locale.languageCode]['about_me'];
  }

  String get shedule {
    return _localizedValues[locale.languageCode]['schedule'];
  }

  String get review {
    return _localizedValues[locale.languageCode]['Reviews'];
  }

  String get client {
    return _localizedValues[locale.languageCode]['Client'];
  }

  String get uploadimage {
    return _localizedValues[locale.languageCode]['upload_image'];
  }

  String get categoryy {
    return _localizedValues[locale.languageCode]['Categorey'];
  }

  String get city {
    return _localizedValues[locale.languageCode]['city'];
  }

  String get talkabouturself {
    return _localizedValues[locale.languageCode]['talk_about_your_self'];
  }

  String get email {
    return _localizedValues[locale.languageCode]['email'];
  }

  String get phonenumber {
    return _localizedValues[locale.languageCode]['phonenumber'];
  }

  String get firstname {
    return _localizedValues[locale.languageCode]['first_name'];
  }

  String get lastname {
    return _localizedValues[locale.languageCode]['last_name'];
  }

  String get descption {
    return _localizedValues[locale.languageCode]['descprtion'];
  }

  String get signupworker {
    return _localizedValues[locale.languageCode]['signup_worker'];
  }

  String get signupcoustmer {
    return _localizedValues[locale.languageCode]['signup_coustmer'];
  }

  String get createaccount {
    return _localizedValues[locale.languageCode]['create_account'];
  }

  String get suggested_tittle {
    return _localizedValues[locale.languageCode]['suggested_work'];
  }

  String get electrican_des {
    return _localizedValues[locale.languageCode]['electrican_des'];
  }

  String get electrican_motv {
    return _localizedValues[locale.languageCode]['electrican_motv'];
  }

  String get repier_des {
    return _localizedValues[locale.languageCode]['repier_des'];
  }

  String get repier_motv {
    return _localizedValues[locale.languageCode]['repier_motv'];
  }

  String get lunder_des {
    return _localizedValues[locale.languageCode]['lunder_des'];
  }

  String get lunder_motv {
    return _localizedValues[locale.languageCode]['lunder_motv'];
  }

  String get cleaning_painting_des {
    return _localizedValues[locale.languageCode]['cleaning_painting_des'];
  }

  String get cleaning_painting_motv {
    return _localizedValues[locale.languageCode]['cleaning_painting_motv'];
  }

  String get cleaning_home_des {
    return _localizedValues[locale.languageCode]['cleaning_home_des'];
  }

  String get cleaning_home_motv {
    return _localizedValues[locale.languageCode]['cleaning_home_motv'];
  }

  String get plumber_des {
    return _localizedValues[locale.languageCode]['plumbing_des'];
  }

  String get plumber_motiv {
    return _localizedValues[locale.languageCode]['plumbing_mot'];
  }

  String get pickservice {
    return _localizedValues[locale.languageCode]['pick_Service'];
  }

  String get plumber {
    return _localizedValues[locale.languageCode]['plumbing'];
  }

  String get movinghome {
    return _localizedValues[locale.languageCode]['moving_home'];
  }

  String get covid {
    return _localizedValues[locale.languageCode]['covid'];
  }

  String get lunder {
    return _localizedValues[locale.languageCode]['lunder'];
  }

  String get electrican {
    return _localizedValues[locale.languageCode]['electrican'];
  }

  String get homepainting {
    return _localizedValues[locale.languageCode]['home_painting'];
  }

  String get homecleaning {
    return _localizedValues[locale.languageCode]['Home_Cleaning'];
  }

  String get repaires {
    return _localizedValues[locale.languageCode]['repairs'];
  }

  String get forgetpass {
    return _localizedValues[locale.languageCode]['forgetpass'];
  }

  String get signin {
    return _localizedValues[locale.languageCode]['signin'];
  }

  String get username {
    return _localizedValues[locale.languageCode]['username'];
  }

  String get password {
    return _localizedValues[locale.languageCode]['password'];
  }

  String get welcome {
    return _localizedValues[locale.languageCode]['welcomee'];
  }

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get signup {
    return _localizedValues[locale.languageCode]['signup'];
  }

  String get changeLanguage {
    return _localizedValues[locale.languageCode]['change_language'];
  }
}
