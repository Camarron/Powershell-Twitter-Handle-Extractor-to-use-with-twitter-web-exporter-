## Credits

Tweet data export powered by [twitter-web-exporter](https://github.com/prinsss/twitter-web-exporter) by [prinsss](https://github.com/prinsss) — a userscript that exports tweets, bookmarks, following/followers lists and more from the Twitter/X web app without requiring API access.

---

## How It Works

1. **Export your tweet archive** using twitter-web-exporter
2. **Extract RT handles** from the export using the PowerShell script

---

## Step 1 — Export Your Tweets

1. Install [Tampermonkey](https://www.tampermonkey.net/) or [Violentmonkey](https://violentmonkey.github.io/)
2. Install [twitter-web-exporter](https://github.com/prinsss/twitter-web-exporter/releases/latest/download/twitter-web-exporter.user.js)
3. On Twitter/X, navigate to your profile page (or the archived account's profile if accessible)
4. Open the twitter-web-exporter panel and select the **User Tweets** module
5. Scroll down to load as many tweets as possible
6. Click **Export Data**, select **CSV**, and make sure **Include all metadata** is toggled on
7. Save the file

---

## Step 2 — Extract Handles (`Read_from_csv.ps1`)

The PowerShell script parses the exported CSV and pulls every unique handle that appears after `RT @` in your tweets — these are the accounts you retweeted and likely followed.

**Requirements:** Windows PowerShell 5.1 or PowerShell 7+

1. Open `extract_rt_handles.ps1` and update `$csvPath` to point to your exported CSV file
2. Run the script:
   ```powershell
   .\Read_from_csv.ps1
   ```
3. The script will print all found handles to the console and save them to `rt_handles.txt` in the same directory

---

## Step 3 — Bulk Follow (Optional)

Once you have `rt_handles.txt`, you can follow the extracted accounts automatically using the companion userscript **Twitter Bulk Follow from List**, available on Greasy Fork:

**[→ Install from Greasy Fork](https://greasyfork.org/en/scripts/581779-twitter-bulk-follow-from-list)**

1. Install the userscript via Tampermonkey or Violentmonkey
2. Navigate to [x.com](https://x.com)
3. Click the **📋 FOLLOW QUEUE** bar in the bottom right corner
4. Paste the contents of `rt_handles.txt` into the text area and click **LOAD INTO QUEUE**
5. Click **START**

---

## Limitations

- Only accounts you retweeted will appear in the extracted list — accounts you followed but never retweeted will not be captured this way
- If an account has changed their handle since your tweets were made, the old handle may no longer resolve and will be marked as an error in the queue
-Twitter/X may prompt for confirmation on some follows (e.g. protected accounts) which the script cannot handle automatically

## I made the bulk follow user script and you do not have to use the handle list from this powershell script with it. it is source agnostic.
  
