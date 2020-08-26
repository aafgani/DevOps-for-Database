ƒ
]C:\Users\Andrya_A354\source\repos\DevOps for Database\WebClient\Controllers\BaseController.cs
	namespace 	
	WebClient
 
. 
Controllers 
{		 
public

 

class

 
BaseController

 
:

  !

Controller

" ,
{ 
	protected 
readonly  
IHttpContextAccessor /
ctx0 3
;3 4
public 
BaseController 
(  
IHttpContextAccessor 2
ctx3 6
)6 7
{ 	
this 
. 
ctx 
= 
ctx 
; 
} 	
} 
} °G
bC:\Users\Andrya_A354\source\repos\DevOps for Database\WebClient\Controllers\EmployeesController.cs
	namespace 	
	WebClient
 
. 
Controllers 
{ 
public 

class 
EmployeesController $
:% &
BaseController' 5
{ 
private 
readonly 
IEmployeeService )
employeeService* 9
;9 :
public 
EmployeesController "
(" # 
IHttpContextAccessor# 7
ctx8 ;
); <
:= >
base? C
(C D
ctxD G
)G H
{ 	
this 
. 
employeeService  
=! "
ctx# &
.& '
HttpContext' 2
.2 3
RequestServices3 B
.B C
GetRequiredServiceC U
<U V
IEmployeeServiceV f
>f g
(g h
)h i
;i j
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Index) .
(. /
)/ 0
{ 	
return 
View 
( 
await 
employeeService -
.- . 
GetListEmployeeAsync. B
(B C
)C D
)D E
;E F
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Details) 0
(0 1
int1 4
?4 5
id6 8
)8 9
{   	
if!! 
(!! 
id!! 
==!! 
null!! 
)!! 
{"" 
return## 
NotFound## 
(##  
)##  !
;##! "
}$$ 
var&& 
employee&& 
=&& 
await&&  
employeeService&&! 0
.&&0 1 
GetEmployeeByIdAsync&&1 E
(&&E F
id&&F H
.&&H I
Value&&I N
)&&N O
;&&O P
if(( 
((( 
employee(( 
==(( 
null((  
)((  !
{)) 
return** 
NotFound** 
(**  
)**  !
;**! "
}++ 
return-- 
View-- 
(-- 
employee--  
)--  !
;--! "
}.. 	
public11 
IActionResult11 
Create11 #
(11# $
)11$ %
{22 	
return33 
View33 
(33 
)33 
;33 
}44 	
[99 	
HttpPost99	 
]99 
[:: 	$
ValidateAntiForgeryToken::	 !
]::! "
public;; 
async;; 
Task;; 
<;; 
IActionResult;; '
>;;' (
Create;;) /
(;;/ 0
[;;0 1
Bind;;1 5
(;;5 6
$str;;6 T
);;T U
];;U V
Employee;;W _
employee;;` h
);;h i
{<< 	
if== 
(== 

ModelState== 
.== 
IsValid== "
)==" #
{>> 
await?? 
employeeService?? %
.??% &
AddNewEmployeeAsync??& 9
(??9 :
employee??: B
)??B C
;??C D
returnAA 
RedirectToActionAA '
(AA' (
nameofAA( .
(AA. /
IndexAA/ 4
)AA4 5
)AA5 6
;AA6 7
}BB 
returnCC 
ViewCC 
(CC 
employeeCC  
)CC  !
;CC! "
}DD 	
publicGG 
asyncGG 
TaskGG 
<GG 
IActionResultGG '
>GG' (
EditGG) -
(GG- .
intGG. 1
?GG1 2
idGG3 5
)GG5 6
{HH 	
ifII 
(II 
idII 
==II 
nullII 
)II 
{JJ 
returnKK 
NotFoundKK 
(KK  
)KK  !
;KK! "
}LL 
varNN 
employeeNN 
=NN 
awaitNN  
employeeServiceNN! 0
.NN0 1 
GetEmployeeByIdAsyncNN1 E
(NNE F
idNNF H
.NNH I
ValueNNI N
)NNN O
;NNO P
ifOO 
(OO 
employeeOO 
==OO 
nullOO  
)OO  !
{PP 
returnQQ 
NotFoundQQ 
(QQ  
)QQ  !
;QQ! "
}RR 
returnSS 
ViewSS 
(SS 
employeeSS  
)SS  !
;SS! "
}TT 	
[YY 	
HttpPostYY	 
]YY 
[ZZ 	$
ValidateAntiForgeryTokenZZ	 !
]ZZ! "
public[[ 
async[[ 
Task[[ 
<[[ 
IActionResult[[ '
>[[' (
Edit[[) -
([[- .
int[[. 1
id[[2 4
,[[4 5
[[[6 7
Bind[[7 ;
([[; <
$str[[< b
)[[b c
][[c d
Employee[[e m
employee[[n v
)[[v w
{\\ 	
if]] 
(]] 
id]] 
!=]] 
employee]] 
.]] 

EmployeeId]] )
)]]) *
{^^ 
return__ 
NotFound__ 
(__  
)__  !
;__! "
}`` 
ifbb 
(bb 

ModelStatebb 
.bb 
IsValidbb "
)bb" #
{cc 
trydd 
{ee 
awaitff 
employeeServiceff )
.ff) *
UpdateEmployeeff* 8
(ff8 9
employeeff9 A
)ffA B
;ffB C
}gg 
catchhh 
(hh (
DbUpdateConcurrencyExceptionhh 3
)hh3 4
{ii 
ifjj 
(jj 
!jj 
EmployeeExistsjj '
(jj' (
employeejj( 0
.jj0 1

EmployeeIdjj1 ;
)jj; <
)jj< =
{kk 
returnll 
NotFoundll '
(ll' (
)ll( )
;ll) *
}mm 
elsenn 
{oo 
throwpp 
;pp 
}qq 
}rr 
returnss 
RedirectToActionss '
(ss' (
nameofss( .
(ss. /
Indexss/ 4
)ss4 5
)ss5 6
;ss6 7
}tt 
returnuu 
Viewuu 
(uu 
employeeuu  
)uu  !
;uu! "
}vv 	
publicyy 
asyncyy 
Taskyy 
<yy 
IActionResultyy '
>yy' (
Deleteyy) /
(yy/ 0
intyy0 3
?yy3 4
idyy5 7
)yy7 8
{zz 	
if{{ 
({{ 
id{{ 
=={{ 
null{{ 
){{ 
{|| 
return}} 
NotFound}} 
(}}  
)}}  !
;}}! "
}~~ 
var
ÄÄ 
employee
ÄÄ 
=
ÄÄ 
await
ÄÄ  
employeeService
ÄÄ! 0
.
ÄÄ0 1"
GetEmployeeByIdAsync
ÄÄ1 E
(
ÄÄE F
id
ÄÄF H
.
ÄÄH I
Value
ÄÄI N
)
ÄÄN O
;
ÄÄO P
if
ÅÅ 
(
ÅÅ 
employee
ÅÅ 
==
ÅÅ 
null
ÅÅ  
)
ÅÅ  !
{
ÇÇ 
return
ÉÉ 
NotFound
ÉÉ 
(
ÉÉ  
)
ÉÉ  !
;
ÉÉ! "
}
ÑÑ 
return
ÜÜ 
View
ÜÜ 
(
ÜÜ 
employee
ÜÜ  
)
ÜÜ  !
;
ÜÜ! "
}
áá 	
[
ää 	
HttpPost
ää	 
,
ää 

ActionName
ää 
(
ää 
$str
ää &
)
ää& '
]
ää' (
[
ãã 	&
ValidateAntiForgeryToken
ãã	 !
]
ãã! "
public
åå 
async
åå 
Task
åå 
<
åå 
IActionResult
åå '
>
åå' (
DeleteConfirmed
åå) 8
(
åå8 9
int
åå9 <
id
åå= ?
)
åå? @
{
çç 	
var
éé 
employee
éé 
=
éé 
await
éé  
employeeService
éé! 0
.
éé0 1"
GetEmployeeByIdAsync
éé1 E
(
ééE F
id
ééF H
)
ééH I
;
ééI J
await
èè 
employeeService
èè !
.
èè! "!
DeleteEmployeeAsync
èè" 5
(
èè5 6
employee
èè6 >
)
èè> ?
;
èè? @
return
êê 
RedirectToAction
êê #
(
êê# $
nameof
êê$ *
(
êê* +
Index
êê+ 0
)
êê0 1
)
êê1 2
;
êê2 3
}
ëë 	
private
ìì 
bool
ìì 
EmployeeExists
ìì #
(
ìì# $
int
ìì$ '
id
ìì( *
)
ìì* +
{
îî 	
return
ïï 
employeeService
ïï "
.
ïï" #
AnyEmployee
ïï# .
(
ïï. /
id
ïï/ 1
)
ïï1 2
;
ïï2 3
}
ññ 	
}
óó 
}òò ˜
]C:\Users\Andrya_A354\source\repos\DevOps for Database\WebClient\Controllers\HomeController.cs
	namespace

 	
	WebClient


 
.

 
Controllers

 
{ 
public 

class 
HomeController 
:  !

Controller" ,
{ 
private 
readonly 
ILogger  
<  !
HomeController! /
>/ 0
_logger1 8
;8 9
public 
HomeController 
( 
ILogger %
<% &
HomeController& 4
>4 5
logger6 <
)< =
{ 	
_logger 
= 
logger 
; 
} 	
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
View 
( 
) 
; 
} 	
public 
IActionResult 
Privacy $
($ %
)% &
{ 	
return 
View 
( 
) 
; 
} 	
[ 	
ResponseCache	 
( 
Duration 
=  !
$num" #
,# $
Location% -
=. /!
ResponseCacheLocation0 E
.E F
NoneF J
,J K
NoStoreL S
=T U
trueV Z
)Z [
][ \
public   
IActionResult   
Error   "
(  " #
)  # $
{!! 	
return"" 
View"" 
("" 
new"" 
ErrorViewModel"" *
{""+ ,
	RequestId""- 6
=""7 8
Activity""9 A
.""A B
Current""B I
?""I J
.""J K
Id""K M
??""N P
HttpContext""Q \
.""\ ]
TraceIdentifier""] l
}""m n
)""n o
;""o p
}## 	
}$$ 
}%% £
XC:\Users\Andrya_A354\source\repos\DevOps for Database\WebClient\Models\ErrorViewModel.cs
	namespace 	
	WebClient
 
. 
Models 
{ 
public 

class 
ErrorViewModel 
{ 
public 
string 
	RequestId 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
bool		 
ShowRequestId		 !
=>		" $
!		% &
string		& ,
.		, -
IsNullOrEmpty		- :
(		: ;
	RequestId		; D
)		D E
;		E F
}

 
} °

JC:\Users\Andrya_A354\source\repos\DevOps for Database\WebClient\Program.cs
	namespace

 	
	WebClient


 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ˇ
JC:\Users\Andrya_A354\source\repos\DevOps for Database\WebClient\Startup.cs
	namespace 	
	WebClient
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{   	
services!! 
.!! 
AddSingleton!! !
<!!! " 
IHttpContextAccessor!!" 6
,!!6 7
HttpContextAccessor!!8 K
>!!K L
(!!L M
)!!M N
;!!N O
services## 
.## 
AddDbContext## !
<##! "
DatabaseContext##" 1
>##1 2
(##2 3
options##3 :
=>##; =
options$$ 
.$$ 
UseSqlServer$$ (
($$( )
Configuration$$) 6
.$$6 7
GetConnectionString$$7 J
($$J K
$str$$K ]
)$$] ^
)$$^ _
)$$_ `
;$$` a
services&& 
.&& 
	AddScoped&& 
<&& 
IUnitOfWork&& *
,&&* +

UnitOfWork&&, 6
>&&6 7
(&&7 8
)&&8 9
;&&9 :
services'' 
.'' 
	AddScoped'' 
<'' 
IEmployeeService'' /
,''/ 0
EmployeeService''1 @
>''@ A
(''A B
)''B C
;''C D
services** 
.** #
AddControllersWithViews** ,
(**, -
)**- .
;**. /
}++ 	
public.. 
void.. 
	Configure.. 
(.. 
IApplicationBuilder.. 1
app..2 5
,..5 6
IWebHostEnvironment..7 J
env..K N
)..N O
{// 	
if00 
(00 
env00 
.00 
IsDevelopment00 !
(00! "
)00" #
)00# $
{11 
app22 
.22 %
UseDeveloperExceptionPage22 -
(22- .
)22. /
;22/ 0
}33 
else44 
{55 
app66 
.66 
UseExceptionHandler66 '
(66' (
$str66( 5
)665 6
;666 7
app88 
.88 
UseHsts88 
(88 
)88 
;88 
}99 
app:: 
.:: 
UseHttpsRedirection:: #
(::# $
)::$ %
;::% &
app;; 
.;; 
UseStaticFiles;; 
(;; 
);;  
;;;  !
app== 
.== 

UseRouting== 
(== 
)== 
;== 
app?? 
.?? 
UseAuthorization??  
(??  !
)??! "
;??" #
appAA 
.AA 
UseEndpointsAA 
(AA 
	endpointsAA &
=>AA' )
{BB 
	endpointsCC 
.CC 
MapControllerRouteCC ,
(CC, -
nameDD 
:DD 
$strDD #
,DD# $
patternEE 
:EE 
$strEE E
)EEE F
;EEF G
}FF 
)FF 
;FF 
}GG 	
}HH 
}II 