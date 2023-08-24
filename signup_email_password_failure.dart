
class SignUpWithEmailAndPasswordFailure{
  final String message;

 const SignUpWithEmailAndPasswordFailure([this.message ="An unknown error occured"]);
 factory SignUpWithEmailAndPasswordFailure.code(String code){
   switch(code){
     case 'weak-password' :
       return const SignUpWithEmailAndPasswordFailure('please enter a strong password.');
     case 'invalid-email' :
       return const SignUpWithEmailAndPasswordFailure('please enter a valid email.');
     case 'user-disable' :
       return const SignUpWithEmailAndPasswordFailure('User has been disabled');
     case 'email-already-in-use' :
       return const SignUpWithEmailAndPasswordFailure('An account already exists for this account');
     case 'operation-not-allowed' :
       return const SignUpWithEmailAndPasswordFailure('Operation is not allowed');
     default:
       return const SignUpWithEmailAndPasswordFailure();
   }
 }
}