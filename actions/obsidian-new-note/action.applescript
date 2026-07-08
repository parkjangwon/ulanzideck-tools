set homePath to POSIX path of (path to home folder)
set vaultPath to homePath & "Documents/Space"
set notePath to my nextUntitledPath(vaultPath)

do shell script "touch " & quoted form of notePath
do shell script "open -a " & quoted form of "Obsidian" & " " & quoted form of notePath

on nextUntitledPath(vaultPath)
	set basePath to vaultPath & "/무제.md"
	if not my fileExists(basePath) then return basePath
	set suffixNumber to 1
	repeat
		set candidatePath to vaultPath & "/무제 " & suffixNumber & ".md"
		if not my fileExists(candidatePath) then return candidatePath
		set suffixNumber to suffixNumber + 1
	end repeat
end nextUntitledPath

on fileExists(posixPath)
	try
		do shell script "test -e " & quoted form of posixPath
		return true
	on error
		return false
	end try
end fileExists
