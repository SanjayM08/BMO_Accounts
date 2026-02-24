select * from mailing;

select substr(mail,instr (mail,'@')) from mailing;

/*sanjayms0865@gmail.com
mss681956@gmail.com
loverboysanju@gmail.com
modus@gmail.com*/

select rtrim(substr(mail,1,instr(mail,'@')),'@') from mailing;

select rtrim(substr(mail,1,instr(mail,'@')),'@') from mailing;
