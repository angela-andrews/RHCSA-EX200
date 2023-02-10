# Shell Expansion

## Create multiple files/directories with brace expansion
```
touch beyonce_album_{Renaissance,Lemonade,B-Day}

mkdir -pv novels/preston_and_child/{pendergast,gideon_crew,nora_and_corrie}
```
![Using Brace Expansion](/images/tree.png)

## Use Brace Expansion to create files/directories within a range
```
mkdir {4..1}.0_Students

touch RHEL{6..9}
```

## Rename all files in the current directory: 
```
rename .htm .html *
```
## Tilde Expansion

The tilde is an abbreviation for the current users home directory. 
You can use the tilde as a shortcut to a users home directory

```
$ cd ~

$ mkdir -pv ~/vacation/plans/pics

# cd ~student
```

![Using Tilde Expansion](/images/tilde.png)

## Variables

- Create a variable with variableName=variable
- If your variable has spaces, enclose in quotes
- Echo out a variable prefaced by a $
- You can use curly braces to return variables without ambiguity
- Unset a variable using the command _unset_
- To literally print a variable name, use a \
    - \$HOME

## Command Substitution
 
 Allows the output of a command to replace the command itself.

 ```
 cp myconfig{,.$(date +%F)}

 echo "System hostname is: $(hostname)"
```

## Bonus Tips
- use cd - to get back to your previous directory
- Use ? in a search term to match the exact number of characters
    - ls f???? will find a file that begins with f that has exactly 4 characters after it
