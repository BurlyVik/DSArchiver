# DSArchiver
The PowerShell function DSArchiver automatically backs up Dark Souls Remastered save files at timed intervals, helping to prevent progress loss and recover from corrupted saves caused by crashes, power outages, or PvP invasions that result in corrupted files.

![image](https://github.com/user-attachments/assets/58b40e47-3510-443a-bffa-676dbef5ddc8)

#  Why Use It?
Much like the auto-save and rolling-backup systems in games like Space Engineers or Valheim, this tool ensures you always have a recent backup of your game progress. If an invader or game error corrupts your save, you can easily restore a previous version from the backup folder.

# Inputs Required (Manual Edits):
- Replace [USER] with your Windows user profile name.
- Replace [SaveID] with your specific Dark Souls save ID (numeric folder name).

# How It Works:
- Prepares Paths:
    Targets your save folder and backup location.
    Ensures the backup folder exists.

- Monitors & Waits:
    Shows a live countdown timer until the next backup (_default: every 10 minutes_).
    Displays whether the save path is currently in use (_if supported via Test-PathInUse_).

- Performs Backups:
    Zips the save folder and timestamps it (Backup_MMdd_hhmm.zip).
    Stores it in the backup directory.
    Keeps only the last 5 backups, deleting older ones automatically.

- Repeats Forever:
    Runs in a loop, maintaining fresh backups indefinitely.

# Benefits:
- Protects against file corruption from bad invades, system crashes, or mod misbehavior.
- Prevents save scumming penalties by storing independent zip files (_undesirable outcomes_).
- Just run it alongside your game, Control+C when done playing.

# Note:
Consider changing your background to black for readbility:
- Right-click the Title Bar
    At the top of the PowerShell window, right-click the blue title bar (where it says Windows PowerShell).
- Click "Properties"
    From the context menu that appears, select Properties.

   ![image](https://github.com/user-attachments/assets/be382f89-6983-4eba-ad47-5f3c3537d6ce)
  
- Navigate to the "Colors" Tab
    In the Properties dialog box, click the "Colors" tab.
- Select “Screen Background”
    Under “Selected Screen Colors”, choose Screen Background.
    You'll see a palette of colors or the option to set a custom RGB value.
- Pick a Color
    Click a preset color or define a custom one using the Red, Green, Blue (RGB) fields below the color grid.

  ![image](https://github.com/user-attachments/assets/faa7d746-1e4a-48de-b6ab-6366053913ff)

- Click “OK”
