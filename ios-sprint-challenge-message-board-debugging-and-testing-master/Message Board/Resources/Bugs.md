## BUGS.md

Bug 1. tableview not populating
    -FIXED need to call .resume() for dataTask to run. moved .reloadData to the  main queue
    -unit test - testDataTaskRuns()

Bug 2. Thread title does not change on thread detail view
    -FIXED

Bug 3. Send button non responsive
    -FIXED- added message text properly

Bug4. Fetch Message thread no decode
    - FIXED TRY to decode from dictionary to extract values 
    - modify MessageThreadController.fetchMessageThreads to decode dictionary
    -add .resume()
    -unit test - testFetchDataTask()
    
Bug 5:  Copy of message threads when reload table view
    - FIXED added a view did load
    
Bug 6: When SENDing a message it does not show in table view unless you navigate back 
    -
Bug 7: Cancel message Button
    -

