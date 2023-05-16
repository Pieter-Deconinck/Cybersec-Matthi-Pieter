# Cybersec-Matthi-Pieter

This repository is for our Cybersecurity & Virtualization course at [Hogent](https://hogent.be). 

This repository was made by [Pieter deconinck](https://github.com/Pieter-Deconinck) & [Matthias appelmans](https://github.com/mappelman)  
We are 2 students at [Hogent](https://hogent.be), currently studying for a [Professional bachelor in applied informatics](https://www.hogent.be/en/future-student/bachelors/applied-information-technology/).

Feel free to connect on [linkedin](https://www.linkedin.com/in/pieter-deconinck-/)

**Content** 

Wordpress before version 5.5.2 used XML-RPC, a remote procedure call (RPC). It was a way for external applications and services to communicate with the wordpress website. It offered a variety of functions the applications could use. But along with it came a few security and performance problems. One of the biggest was a XML-RPC attack. 

A XML request not only makes it easier to automate DOS or Bruteforce attacks, but it has the added benefit of allowing Multicalls. 
In a single POST request you can include a large array of XML requests. This can be used to more efficiently DOS the webserver or Bruteforce the wordpress credentials

This repository contains a Lab in where this can be tested. Follow the instructions in the [Documentation](./Documentation/Deployment%20plan.md) if you are interested. (it's in Dutch)

