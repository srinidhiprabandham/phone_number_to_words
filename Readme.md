# Phone number to word converter.
  
  - Given a 10digit phone number (which does not contain 0 and 1) the program converts it to a meaning full word from a given dictionary.



# Installation steps.

  - Clone this repo.
  - cd to project folder.
  - install ruby 2.3.0 (if rvm is installed it should prompt you to do so automatically.)
  - bundle install (To get all dependencies)

# Execution Steps.

  - `ruby converter.rb`


# Algorithm used (thought process)

  The problem statement can be visualize as that of a non qwerty keypad. 
  
  ![old keypad](http://d1hyf4ir1gqw6c.cloudfront.net//wp-content/uploads/phoneKeyboard.png)


  IF we have to calculate the words that could be formed for a given sequence of numbers say 567
  then the possible combinations would be like so - 
    jmp jmq jmr jms jnp jnq jnr jns jop joq jor jos 
    kmp kmq kmr kms knp knq knr kns kop koq kor kos 
    lmp lmq lmr lms lnp lnq lnr lns lop loq lor los 

  That is we start at 5 -> [JKL] and for every character in 5 we can map to every character in the other two numbers 6 and 7.


  This leaves us with a total combination of 4^10 = 1,04,856 for a 10 digit number.

  We will use ordered pair to retrieve all permutation and combinations for the given number.
  And convert the resulting pairs to `Set`.
  Once we have the combination set we will to a `Set` intersection with the provided dictionary to get the resulting word.
