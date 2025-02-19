      # Retrieve all triggers from the specified Synapse workspace
      $triggersSynapse = Get-AzSynapseTrigger -WorkspaceName "apk"
       
      # Loop through the list of trigger names and stop each one
      $env:triggerList | ForEach-Object {
          $triggerName = $_  # The current trigger name in the loop
          $trigger = $triggersSynapse | Where-Object { $_.Name -eq $triggerName }
      
          if ($trigger) {
      		write-host "$trigger.Name"
              Stop-AzSynapseTrigger -WorkspaceName "apk" -Name $trigger.Name
              Write-Host "Stopped trigger: $($trigger.Name)"
          } else {
              Write-Host "Trigger '$($_)' not found in the workspace."
          }
      }
