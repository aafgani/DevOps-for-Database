�
fC:\Users\Andrya_A354\source\repos\DevOps for Database\Data Access Layer\DataContext\DatabaseContext.cs
	namespace		 	
Data_Access_Layer		
 
.		 
DataContext		 '
{

 
public 

class 
DatabaseContext  
:! "
	DbContext# ,
,, -
IDatabaseContext. >
{ 
public
DatabaseContext
(
DbContextOptions
options
)
:
base
(
options
)
{ 	
} 	
public 
DbSet 
< 
Employee 
> 
Employee '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} �
dC:\Users\Andrya_A354\source\repos\DevOps for Database\Data Access Layer\Interace\IDatabaseContext.cs
	namespace 	
Data_Access_Layer
 
. 
Interace $
{		 
public

 

	interface

 
IDatabaseContext

 &
:

' (
IDisposable

) 4
{ 
Task
<
int
>
SaveChangesAsync
(
CancellationToken
cancellationToken
)
;
DbSet 
<
TEntity 
> 
Set 
< 
TEntity "
>" #
(# $
)$ %
where& +
TEntity, 3
:4 5
class6 ;
;; <
} 
} �
fC:\Users\Andrya_A354\source\repos\DevOps for Database\Data Access Layer\Interace\IGenericRepository.cs
	namespace 	
Data_Access_Layer
 
. 
Interace $
{ 
public		 

	interface		 
IGenericRepository		 '
{

 
Task 
< 
IEnumerable
< 
T 
> 
> 
	FindAsync &
<& '
T' (
>( )
() *

Expression* 4
<4 5
Func5 9
<9 :
T: ;
,; <
bool= A
>A B
>B C

expressionD N
)N O
whereP U
TV W
:X Y
classZ _
;_ `
Task 
< 
T
>  
SingleOrDefaultAsync $
<$ %
T% &
>& '
(' (

Expression( 2
<2 3
Func3 7
<7 8
T8 9
,9 :
bool; ?
>? @
>@ A

expressionB L
)L M
whereN S
TT U
:V W
classX ]
;] ^
void
Add
<
T
>
(
T
entity
)
where
T
:
class
;
void 
Update
< 
T 
> 
( 
T 
entity 
)  
where! &
T' (
:) *
class+ 0
;0 1
void 
Delete
< 
T 
> 
( 
T 
entity 
)  
where! &
T' (
:) *
class+ 0
;0 1
Task 
< 
IEnumerable
< 
T 
> 
> 
List !
<! "
T" #
># $
($ %
)% &
where' ,
T- .
:/ 0
class1 6
;6 7
bool 
Any
< 
T 
> 
( 

Expression 
< 
Func #
<# $
T$ %
,% &
bool' +
>+ ,
>, -

expression. 8
)8 9
where: ?
T@ A
:B C
classD I
;I J
} 
} �
_C:\Users\Andrya_A354\source\repos\DevOps for Database\Data Access Layer\Interace\IUnitOfWork.cs
	namespace 	
Data_Access_Layer
 
. 
Interace $
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{		 
IGenericRepository

 

Repository

 %
(

% &
)

& '
;

' (
Task 
CommitAsync
( 
) 
; 
} 
}
gC:\Users\Andrya_A354\source\repos\DevOps for Database\Data Access Layer\Repository\GenericRepository.cs
	namespace

 	
Data_Access_Layer


 
.

 

Repository

 &
{ 
public 

class 
GenericRepository "
:# $
IGenericRepository% 7
{
private 
readonly 
IDatabaseContext )
databaseContext* 9
;9 :
public 
GenericRepository  
(  !
IDatabaseContext! 1
databaseContext2 A
)A B
{ 	
this 
. 
databaseContext  
=! "
databaseContext# 2
;2 3
} 	
public 
void 
Add 
< 
T 
> 
( 
T 
entity #
)# $
where% *
T+ ,
:- .
class/ 4
{ 	
databaseContext 
. 
Set 
<  
T  !
>! "
(" #
)# $
.$ %
Add% (
(( )
entity) /
)/ 0
;0 1
} 	
public 
void 
Delete 
< 
T 
> 
( 
T 
entity  &
)& '
where( -
T. /
:0 1
class2 7
{ 	
databaseContext 
. 
Set 
<  
T  !
>! "
(" #
)# $
.$ %
Remove% +
(+ ,
entity, 2
)2 3
;3 4
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
T& '
>' (
>( )
	FindAsync* 3
<3 4
T4 5
>5 6
(6 7

Expression7 A
<A B
FuncB F
<F G
TG H
,H I
boolJ N
>N O
>O P

expressionQ [
)[ \
where] b
Tc d
:e f
classg l
{   	
return!! 
await!! 
databaseContext!! (
.!!( )
Set!!) ,
<!!, -
T!!- .
>!!. /
(!!/ 0
)!!0 1
.!!1 2
Where!!2 7
(!!7 8

expression!!8 B
)!!B C
.!!C D
ToListAsync!!D O
(!!O P
)!!P Q
;!!Q R
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
T$$ 
>$$  
SingleOrDefaultAsync$$ 1
<$$1 2
T$$2 3
>$$3 4
($$4 5

Expression$$5 ?
<$$? @
Func$$@ D
<$$D E
T$$E F
,$$F G
bool$$H L
>$$L M
>$$M N

expression$$O Y
)$$Y Z
where$$[ `
T$$a b
:$$c d
class$$e j
{%% 	
return&& 
await&& 
databaseContext&& (
.&&( )
Set&&) ,
<&&, -
T&&- .
>&&. /
(&&/ 0
)&&0 1
.&&1 2
Where&&2 7
(&&7 8

expression&&8 B
)&&B C
.&&C D 
SingleOrDefaultAsync&&D X
(&&X Y
)&&Y Z
;&&Z [
}'' 	
public)) 
void)) 
Update)) 
<)) 
T)) 
>)) 
()) 
T)) 
entity))  &
)))& '
where))( -
T)). /
:))0 1
class))2 7
{** 	
databaseContext,, 
.,, 
Set,, 
<,,  
T,,  !
>,,! "
(,," #
),,# $
.,,$ %
Update,,% +
(,,+ ,
entity,,, 2
),,2 3
;,,3 4
}-- 	
public// 
async// 
Task// 
<// 
IEnumerable// %
<//% &
T//& '
>//' (
>//( )
List//* .
<//. /
T/// 0
>//0 1
(//1 2
)//2 3
where//4 9
T//: ;
://< =
class//> C
{00 	
return11 
await11 
databaseContext11 (
.11( )
Set11) ,
<11, -
T11- .
>11. /
(11/ 0
)110 1
.111 2
ToListAsync112 =
(11= >
)11> ?
;11? @
}22 	
public44 
bool44 
Any44 
<44 
T44 
>44 
(44 

Expression44 %
<44% &
Func44& *
<44* +
T44+ ,
,44, -
bool44. 2
>442 3
>443 4

expression445 ?
)44? @
where44A F
T44G H
:44I J
class44K P
{55 	
return66 
databaseContext66 #
.66# $
Set66$ '
<66' (
T66( )
>66) *
(66* +
)66+ ,
.66, -
Any66- 0
(660 1

expression661 ;
)66; <
;66< =
}77 	
}88 
}99 �
`C:\Users\Andrya_A354\source\repos\DevOps for Database\Data Access Layer\Repository\UnitOfWork.cs
	namespace 	
Data_Access_Layer
 
. 

Repository &
{		 
public

 

class

 

UnitOfWork

 
:

 
IUnitOfWork

 )
{ 
private 
readonly 
DatabaseContext (
_databaseContext) 9
;9 :
private
bool
disposed
=
false
;
public 

UnitOfWork 
( 
DatabaseContext )
databaseContext* 9
)9 :
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
public 
Task 
CommitAsync 
(  
)  !
{ 	
return 
_databaseContext #
.# $
SaveChangesAsync$ 4
(4 5
)5 6
;6 7
} 	
public 
void 
Dispose 
( 
) 
{ 	
Dispose 
( 
true 
) 
; 
GC 
. 
SuppressFinalize 
(  
this  $
)$ %
;% &
} 	
private 
void 
Dispose 
( 
bool !
	disposing" +
)+ ,
{ 	
if   
(   
!   
this   
.   
disposed   
)   
{!! 
if"" 
("" 
	disposing"" 
)"" 
{## 
_databaseContext$$ $
.$$$ %
Dispose$$% ,
($$, -
)$$- .
;$$. /
}%% 
}&& 
this'' 
.'' 
disposed'' 
='' 
true''  
;''  !
}(( 	
public** 
IGenericRepository** !

Repository**" ,
(**, -
)**- .
{++ 	
return,, 
new,, 
GenericRepository,, (
(,,( )
_databaseContext,,) 9
),,9 :
;,,: ;
}-- 	
}.. 
}// 