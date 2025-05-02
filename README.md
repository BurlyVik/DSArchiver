# DSArchiver
The PowerShell function DSArchiver automatically backs up Dark Souls Remastered save files at timed intervals, helping to prevent progress loss and recover from corrupted saves caused by crashes, power outages, or PvP invasions that result in corrupted files.

#  Why Use It?
Much like the auto-save and rolling-backup systems in games like Space Engineers or Valheim, this tool ensures you always have a recent backup of your game progress. If an invader or game error corrupts your save, you can easily restore a previous version from the backup folder.

- Replace [USER] with your Windows user profile name.
- Replace [SaveID] with your specific Dark Souls save ID (numeric folder name).

# How It Works:

    Prepares Paths:

        Targets your save folder and backup location.

        Ensures the backup folder exists.

    Monitors & Waits:

        Shows a live countdown timer until the next backup (default: every 10 minutes).

        Displays whether the save path is currently in use (if supported via Test-PathInUse).

    Performs Backups:

        Zips the save folder and timestamps it (Backup_MMdd_hhmm.zip).

        Stores it in the backup directory.

        Keeps only the last 5 backups, deleting older ones automatically.

    Repeats Forever:

        Runs in a loop, maintaining fresh backups indefinitely.
