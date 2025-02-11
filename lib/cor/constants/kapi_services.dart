const String _hostAddressMobile = 'http://192.168.1.11/';
const String _hostAddressChroom = 'http://localhost/';
const String _signUpRequest = 'authontication/auth/signUp.php/';
const String _singninRequest = 'authontication/auth/signin.php/';
const String _AddNoteRequest = 'authontication/notes/addNotes.php/';
const String _ViewNoteRequest = 'authontication/notes/viewNotes.php/';
const String _deleteNoteRequest = 'authontication/notes/deleNotes.php/';
const String _updateNoteRequest = 'authontication/notes/updateNotes.php/';
const String _uploadImage = 'authontication/notes/addimage.php/';
const String kurlImageRout = '${_hostAddressMobile}authontication/dirctuplode/';
const String kurlSignUp_PostRequest = '$_hostAddressMobile$_signUpRequest';
const String kurlSignin_PostRequest = '$_hostAddressMobile$_singninRequest';
const String kurlAddNote_PostRequest = '$_hostAddressMobile$_AddNoteRequest';
const String kurlupdatNote_PostRequest =
    '$_hostAddressMobile$_updateNoteRequest';
const String kurlViewNote_PostRequest = '$_hostAddressMobile$_ViewNoteRequest';
const String kurldeleteNote_PostRequest =
    '$_hostAddressMobile$_deleteNoteRequest';
const String kurlUploadImage_PostRequest = '$_hostAddressMobile$_uploadImage';


enum linkHost<String> { mobile, chrom }
