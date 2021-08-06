<#
This program is to copy all data from Desktop, Documents, Downloads, Pictures
and save it to a file on the C:\Users\$env:USERNAME 

It would be nice if we can also compress this.  

The purpose is to have an easy local backup to copy to over to any destination. 


#>

# creates universal user variable // purpose is so anyone can run this
$user = $env:USERNAME


# Deletes old backup // it would be nice to just rename this and append a number to it.  
remove-item C:\Users\$user\bu -Recurse -force
remove-item C:\Users\$user\Desktop\bu.zip 


# creates "bu" folder that will be the destination the data gets copied to. 
$comp = mkdir C:\Users\$user\bu


Copy-item C:\Users\$user\Desktop -Recurse C:\Users\$user\bu -Verbose
Copy-item C:\Users\$user\Documents -Recurse C:\Users\$user\bu -Verbose
Copy-item C:\Users\$user\Downloads -Recurse C:\Users\$user\bu -Verbose
Copy-item C:\Users\$user\Pictures -Recurse C:\Users\$user\bu -Verbose
Copy-item C:\ldoc -Recurse C:\Users\$user\bu -Verbose
Copy-Item C:\shared -Recurse C:\Users\$user\bu -Verbose


# takes bu folder from $comp location and compresses it to the desktop. 
Compress-Archive -Path $comp -DestinationPath C:\Users\$env:USERNAME\Desktop\bu.zip -CompressionLevel Optimal

# Now afterwards this can be copied over to another location or just leave it on the desktop for a GUI drag and drop. 