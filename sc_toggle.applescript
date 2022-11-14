on run
	tell application "System Events"		tell process "SystemUIServer"
			-- Click the “Screen Mirroring” menu bar item.			#delay 0
						set timeoutSeconds to 0.2			set uiScript to "click menu bar item 5 of menu bar 1 of application process \"Control Centre\""			my doWithTimeout(uiScript, timeoutSeconds)			
			try
				
			-- Select RDT's iPad.			#delay 0.5
							set uiScript to "click checkbox 2 of scroll area 1 of group 1 of window \"Control Centre\" of application process \"Control Centre\""				my doWithTimeout(uiScript, timeoutSeconds)				-- Click the “Screen Mirroring” menu bar item.				#delay 0
				
				on error errorMessage number error_number
					if error_number = -2700 then
					# iPad not connected
					# Connect iPad:
					
						set uiScript to "click checkbox 1 of scroll area 1 of group 1 of window \"Control Centre\" of application process \"Control Centre\""						my doWithTimeout(uiScript, timeoutSeconds)						set uiScript to "click menu bar item 5 of menu bar 1 of application process \"Control Centre\""						my doWithTimeout(uiScript, timeoutSeconds)
						return "Sidecar connected"
					else
						display dialog "Error: Cannot find iPad / something else happened"
						
					end if
					exit
			end try
						set timeoutSeconds to 0.05			set uiScript to "click menu bar item 5 of menu bar 1 of application process \"Control Centre\""			my doWithTimeout(uiScript, timeoutSeconds)
			return "Sidecar disconnected"
		end tell
	end tellend run
on doWithTimeout(uiScript, timeoutSeconds)	set endDate to (current date) + timeoutSeconds	repeat		try			run script "tell application \"System Events\"" & uiScript & "end tell"			exit repeat		on error errorMessage 			if ((current date) > endDate) then				error "Can not " & uiScript			end if		end try	end repeatend doWithTimeout
