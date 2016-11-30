# transfer.pl
Uploads a file to transfer.sh  
Utterly pointless, you could just use curl, but whatever.

You must have LWP::UserAgent available in yer perl.  
Use your systems package manager or cpan or whatever.

Currently it doesn't play nice with shit outside its cwd.  
I'll fix that later.  

example use:  
```
[sky@blue transfer.pl]$ md5sum transfer.pl 
1f573e51bd77756c8cb9ac1544f1e85b  transfer.pl
[sky@blue transfer.pl]$ perl transfer.pl transfer.pl 
Uploading transfer.pl...
This might take a while...
Download URL: https://transfer.sh/P4mkF/transfer.pl

[sky@blue transfer.pl]$ curl -s https://transfer.sh/P4mkF/transfer.pl | md5sum -
1f573e51bd77756c8cb9ac1544f1e85b  -
[sky@blue transfer.pl]$ 
```

Licence: MIT.
