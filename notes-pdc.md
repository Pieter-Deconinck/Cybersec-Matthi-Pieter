Remote code execution on wordpress 2020 https://www.cvedetails.com/cve/CVE-2020-28037/ - SCORE 7.5 - COMPLEXITY: low
        
        is_blog_installed in wp-includes/functions.php in WordPress before 5.5.2 improperly determines whether WordPress is already installed, which might allow an attacker to perform a new installation, leading to remote code execution (as well as a denial of service for the old installation).

Remote code execution on wordpress 2019 https://www.cvedetails.com/cve/CVE-2019-9787/ - SCORE 6.8 - COMPLEXITY: medium

    WordPress before 5.1.1 does not properly filter comment content, leading to Remote Code Execution by unauthenticated users in a default configuration. This occurs because CSRF protection is mishandled, and because Search Engine Optimization of A elements is performed incorrectly, leading to XSS. The XSS results in administrative access, which allows arbitrary changes to .php files. This is related to wp-admin/includes/ajax-actions.php and wp-includes/comment.php.