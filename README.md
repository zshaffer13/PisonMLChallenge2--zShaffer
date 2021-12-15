# PisonMLChallenge2--zShaffer

##Installation
Download the package from GitHub and extract to a local directory. The setuptools for uploading for PIP installation weren't working with Python 3.8 and I have not been able to fix it yet. 

##Developer Notes
I was not able to get this function working as expected as well. I ran into an issue calculating A and had to brute force a value to get my test case to work. There was something with the array comprehension loop that I was not able to understand. Also, the Cython code that was written actually returns slower than the pure Python. Had I been able to get the last calculation correct then that may have changed with further optimization, but I was not able to achieve that. 
