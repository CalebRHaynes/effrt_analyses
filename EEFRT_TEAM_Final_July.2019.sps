* Encoding: UTF-8.
Date: 7/11/2019
Created by: Jasmine

EEfrt: Effort Expenditure for Rewards Task

**Count total number of trials**.
SORT CASES BY ID(A) Trials (D).

IF  ($CASENUM=1 OR ID NE lag(ID)) Count_Trials=Trials.
EXECUTE.

IF ID=lag(ID) Count_Trials=lag(Count_Trials).
EXECUTE.


**Count number of completed trials***.

IF Completed=1 Count_Completed =1.
EXECUTE.

SORT CASES BY ID(A) Count_Completed(D).

IF ID=lag(ID) & Completed=1
Count_Completed=SUM(Count_Completed,lag(Count_Completed)).
EXECUTE.

SORT CASES BY ID(A) Count_Completed(D).

IF ID=lag(ID) Count_Completed=lag(Count_Completed).
EXECUTE.

RECODE Count_Completed (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_Completed 'EEFRT - Number of Completed Trials'.

**Count number of not complete trials***.
IF Completed=0 Count_NotCompleted =1.
EXECUTE.

SORT CASES BY ID(A) Count_NotCompleted(D).

IF ID=lag(ID) & Completed=0
Count_NotCompleted=SUM(Count_NotCompleted,lag(Count_NotCompleted)).
EXECUTE.

SORT CASES BY ID(A) Count_NotCompleted(D).

IF ID=lag(ID) Count_NotCompleted=lag(Count_NotCompleted).
EXECUTE.

RECODE Count_NotCompleted (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_NotCompleted 'EEFRT - Number of Not Completed Trials'.

**Calculate completion rate**.
COMPUTE CompletionRate=Count_Completed / Count_Trials.
EXECUTE.

VARIABLE LABELS CompletionRate 'EEFRT - Completion Rate'.

**Count "easy effort" was chosen**.
IF Choice=0 Count_Easy=1.
EXECUTE.

SORT CASES BY ID(A) Count_Easy(D).

IF ID=lag(ID) & Choice=0 
Count_Easy=SUM(Count_Easy,lag(Count_Easy)).
EXECUTE.

SORT CASES BY ID(A) Count_Easy(D).

IF ID=lag(ID) Count_Easy=lag(Count_Easy).
EXECUTE.

RECODE Count_Easy (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_Easy 'EEFRT - Number of Easy Effort'.

**Count "hard effort" was chosen**.
IF Choice=1 Count_Hard=1.
EXECUTE.

SORT CASES BY ID(A) Count_Hard(D).

IF ID=lag(ID) & Choice=1 
Count_Hard=SUM(Count_Hard,lag(Count_Hard)).
EXECUTE.

SORT CASES BY ID(A) Count_Hard(D).

IF ID=lag(ID) Count_Hard=lag(Count_Hard).
EXECUTE.

RECODE Count_Hard (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_Hard 'EEFRT - Number of Hard Effort'.

**Count "Unchosen"**.
IF Choice=2 Count_Unchosen=1.
EXECUTE.

SORT CASES BY ID(A) Count_Unchosen(D).

IF ID=lag(ID) & Choice=2 
Count_Unchosen=SUM(Count_Unchosen,lag(Count_Unchosen)).
EXECUTE.

SORT CASES BY ID(A) Count_Unchosen(D).

IF ID=lag(ID) Count_Unchosen=lag(Count_Unchosen).
EXECUTE.

RECODE Count_Unchosen (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_Unchosen 'EEFRT - Number of Unchosen (Effort)'.

**Percentage of "Hard Effort"**.
COMPUTE Pct_Hard_Effort = Count_Hard / Count_Trials.
EXECUTE.

VARIABLE LABELS Pct_Hard_Effort 'EEFRT - Percentage of Hard Effort'.

**Percentage of "Easy Effort"**.
COMPUTE Pct_Easy_Effort = Count_Easy / Count_Trials.
EXECUTE.

VARIABLE LABELS Pct_Easy_Effort 'EEFRT - Percentage of Easy Effort'.


**Count "Win"***.
IF Procedure_R=1 Count_Win=1.
EXECUTE.

SORT CASES BY ID(A) Count_Win(D).

IF ID=lag(ID) & Procedure_R=1
Count_Win=SUM(Count_Win,lag(Count_Win)).
EXECUTE.

SORT CASES BY ID(A) Count_Win(D).

IF ID=lag(ID) Count_Win=lag(Count_Win).
EXECUTE.

RECODE Count_Win (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_Win 'EEFRT - Number of Win Trials'.

**Count "Lose"***.
IF Procedure_R=0 Count_Lose=1.
EXECUTE.

SORT CASES BY ID(A) Count_Lose(D).

IF ID=lag(ID) & Procedure_R=0
Count_Lose=SUM(Count_Lose,lag(Count_Lose)).
EXECUTE.

SORT CASES BY ID(A) Count_Lose(D).

IF ID=lag(ID) Count_Lose=lag(Count_Lose).
EXECUTE.

RECODE Count_Lose (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_Lose 'EEFRT - Number of Lose Trials'.


***Count 12% probability***.
IF Probability=12 & Count_Prob12=1.

SORT CASES BY ID(A) Count_Prob12(D).

IF ID=lag(ID) & Probability=12
Count_Prob12=SUM(Count_Prob12,lag(Count_Prob12)).
EXECUTE.

SORT CASES BY ID(A) Count_Prob12(D).

IF ID=lag(ID) Count_Prob12=lag(Count_Prob12).
EXECUTE.

RECODE Count_Prob12 (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_Prob12 'EEFRT - Number of Probability of 12%'.


***Count 50% probability***.
IF Probability=50 & Count_Prob50=1.

SORT CASES BY ID(A) Count_Prob50(D).

IF ID=lag(ID) & Probability=50
Count_Prob50=SUM(Count_Prob50,lag(Count_Prob50)).
EXECUTE.

SORT CASES BY ID(A) Count_Prob50(D).

IF ID=lag(ID) Count_Prob50=lag(Count_Prob50).
EXECUTE.

RECODE Count_Prob50 (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_Prob50 'EEFRT - Number of Probability of 50%'.

***Count 88% probability***.
IF Probability=88 Count_Prob88=1.

SORT CASES BY ID(A) Count_Prob88(D).

IF ID=lag(ID) & Probability=88
Count_Prob88=SUM(Count_Prob88,lag(Count_Prob88)).
EXECUTE.

SORT CASES BY ID(A) Count_Prob88(D).

IF ID=lag(ID) Count_Prob88=lag(Count_Prob88).
EXECUTE.

RECODE Count_Prob88 (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_Prob88 'EEFRT - Number of Probability of 88%'.

***Percentage of 12%***.
COMPUTE Pct_Prob12=Count_Prob12 / Count_Trials.
EXECUTE.

VARIABLE LABELS Pct_Prob12 'EEFRT - Percentage of Probability of 12%'.

***Percentage of 50%***.
COMPUTE Pct_Prob50=Count_Prob50 / Count_Trials.
EXECUTE.

VARIABLE LABELS Pct_Prob50 'EEFRT - Percentage of Probability of 50%'.

***Percentage of 88%***.
COMPUTE Pct_Prob88=Count_Prob88 / Count_Trials.
EXECUTE.

VARIABLE LABELS Pct_Prob88 'EEFRT - Percentage of Probability of 88%'.



*****Overall Outcomes*******.
***Overall Reward Magnitude***.
COMPUTE Overall_RM=Amount.
EXECUTE.

VARIABLE LABELS Overall_RM 'EEFRT - Overall Reward Magnitude'.


***Overall Expected Value***.
COMPUTE Overall_EV = Overall_RM * Probability / 100.
EXECUTE.

VARIABLE LABELS Overall_EV  'EEFRT - Overall Expected Value'.

**Overall Reaction Time***.
COMPUTE Overall_RT = Decision.RT.
EXECUTE.

SORT CASES BY ID(A) Trials(A).

IF ID=lag(ID) Overall_RT=SUM(Overall_RT,lag(Overall_RT)).
EXECUTE.

SORT CASES BY ID(A) Overall_RT(D).

IF ID=lag(ID) Overall_RT=lag(Overall_RT).
EXECUTE.

VARIABLE LABELS Overall_RT 'EEFRT - Overall Reaction Time'.

***Overall Tap Speed***.
COMPUTE Overall_TS = TapSpeed.
EXECUTE.

SORT CASES BY ID(A) Trials(A).

IF ID=lag(ID) Overall_TS=SUM(Overall_TS,lag(Overall_TS)).
EXECUTE.

SORT CASES BY ID(A) Overall_TS(D).
IF ID=lag(ID) Overall_TS=lag(Overall_TS).
EXECUTE.

VARIABLE LABELS Overall_TS 'EEFRT - Overall Tap Speed'.

FORMATS Overall_TS (F8.5).

***Overall Winning Amount***.
SORT CASES BY ID(A) Trials(A).
COMPUTE Overall_WIN_AMT=Winnings.

SORT CASES BY ID(A) Overall_WIN_AMT(D).

IF ID=lag(ID) Overall_WIN_AMT=SUM(Overall_WIN_AMT,lag(Overall_WIN_AMT)).
EXECUTE.

SORT CASES BY ID(A) Overall_WIN_AMT(D).
IF ID=lag(ID) Overall_WIN_AMT=lag(Overall_WIN_AMT).
EXECUTE.

VARIABLE LABELS Overall_WIN_AMT 'EEFRT - Overall Winnings Amount'.

***Overall Number of Wins***.
COMPUTE Overall_WIN_PCT=Count_Win / (Count_Win + Count_Lose).
EXECUTE.

VARIABLE LABELS Overall_WIN_PCT 'EEFRT - Overall Percentage of Wins'.

******Hard Effort & Probabilty of 12%*****.

*****Count Hard Effort and 12%*****.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=12
Count_Hard_Prob12=1.
EXECUTE.

SORT CASES BY ID(A) Count_Hard_Prob12(D).

IF ID=lag(ID) & Choice=1 & Probability=12
Count_Hard_Prob12=SUM(Count_Hard_Prob12,lag(Count_Hard_Prob12)).
EXECUTE.

SORT CASES BY ID(A) Count_Hard_Prob12(D).

IF ID=lag(ID)
Count_Hard_Prob12=lag(Count_Hard_Prob12).
EXECUTE.

RECODE Count_Hard_Prob12 (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_Hard_Prob12 'EEFRT - Count of Hard Effort and Probability of 12%'.

***Proportion of Hard Effort in Probability of 12%***.
COMPUTE Hard_Prob12_Prop=Count_Hard_Prob12 / Count_Prob12.
EXECUTE.

VARIABLE LABELS Hard_Prob12_Prop 'EEFRT - Proportion of Hard Effort and and Probability of 12%'.

***Hard Effort and 12%: Reward Magnitude***.
SORT CASES BY ID(A) Trials(A).
IF Choice=1 & Probability=12 Hard_Prob12_RM=Amount.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob12_RM(D).
IF ID=lag(ID) & Choice=1 & Probability=12
Hard_Prob12_RM=SUM(Hard_Prob12_RM,lag(Hard_Prob12_RM)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob12_RM(D).
IF ID=lag(ID)
Hard_Prob12_RM=lag(Hard_Prob12_RM).
EXECUTE.

RECODE Hard_Prob12_RM (MISSING=0).
EXECUTE.

VARIABLE LABELS Hard_Prob12_RM 'EEFRT - Reward Magnitude of Hard Effort and Probability of 12%'.


***Hard Effort and 12%: Expected Value***.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=12 
Hard_Prob12_EV=Amount * Probability / 100.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob12_EV(D).

IF ID=lag(ID) & Choice=1 & Probability=12
Hard_Prob12_EV=SUM(Hard_Prob12_EV,lag(Hard_Prob12_EV)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob12_EV(D).

IF ID=lag(ID) 
Hard_Prob12_EV=lag(Hard_Prob12_EV).
EXECUTE.

RECODE Hard_Prob12_EV (MISSING=0).
EXECUTE.

VARIABLE LABELS Hard_Prob12_EV 'EEFRT - Expected Value of Hard Effort and Probability of 12%'.


***Hard Effort and 12%: Reaction Time***.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=12 
Hard_Prob12_RT=Decision.RT.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob12_RT(D).

IF ID=lag(ID) & Choice=1 & Probability=12
Hard_Prob12_RT=SUM(Hard_Prob12_RT,lag(Hard_Prob12_RT)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob12_RT(D).

IF ID=lag(ID) 
Hard_Prob12_RT=lag(Hard_Prob12_RT).
EXECUTE.

RECODE Hard_Prob12_RT (MISSING=-999).
EXECUTE.

MISSING VALUES Hard_Prob12_RT (-999).

VARIABLE LABELS Hard_Prob12_RT 'EEFRT - Reaction Time of Hard Effort and Probability of 12%'.

***Hard Effort and 12%: Tap Speed***.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=12 
Hard_Prob12_TS=TapSpeed.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob12_TS(D).

IF ID=lag(ID) & Choice=1 & Probability=12
Hard_Prob12_TS=SUM(Hard_Prob12_TS,lag(Hard_Prob12_TS)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob12_TS(D).

IF ID=lag(ID) 
Hard_Prob12_TS=lag(Hard_Prob12_TS).
EXECUTE.

RECODE Hard_Prob12_TS (MISSING=-999).
EXECUTE.

MISSING VALUES Hard_Prob12_TS (-999).

VARIABLE LABELS Hard_Prob12_TS 'EEFTS - Tap Speed of Hard Effort and Probability of 12%'.

FORMATS Hard_Prob12_TS(F8.5).

***Hard Effort and 12%: Winnings Amount***.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=12 
Hard_Prob12_WIN_AMT=Winnings.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob12_WIN_AMT(D).

IF ID=lag(ID) & Choice=1 & Probability=12
Hard_Prob12_WIN_AMT=SUM(Hard_Prob12_WIN_AMT,lag(Hard_Prob12_WIN_AMT)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob12_WIN_AMT(D).

IF ID=lag(ID) 
Hard_Prob12_WIN_AMT=lag(Hard_Prob12_WIN_AMT).
EXECUTE.

RECODE Hard_Prob12_WIN_AMT (MISSING=-999).
EXECUTE.

MISSING VALUES Hard_Prob12_WIN_AMT (-999).

VARIABLE LABELS Hard_Prob12_WIN_AMT 'EEFTS - Winnings Amount of Hard Effort and Probability of 12%'.

***Hard Effort and 12%: Number of Wins***.
SORT CASES BY ID(A) Trials(A).
IF Choice=1 & Probability=12 & Procedure_R=1
Hard_Prob12_WIN=1.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob12_WIN(D).

IF ID=lag(ID) & Choice=1 & Probability=12 & Procedure_R=1
Hard_Prob12_WIN=SUM(Hard_Prob12_WIN,lag(Hard_Prob12_WIN)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob12_WIN(D).

IF ID=lag(ID) 
Hard_Prob12_WIN=lag(Hard_Prob12_WIN).
EXECUTE.

DO IF (Hard_Prob12_EV > 0).
RECODE Hard_Prob12_WIN (SYSMIS=0).
END IF.
EXECUTE.

DO IF (Hard_Prob12_EV = 0).
RECODE Hard_Prob12_WIN (SYSMIS=-999).
END IF.
EXECUTE.

MISSING VALUES Hard_Prob12_WIN (-999).

VARIABLE LABELS Hard_Prob12_WIN 'EEFRT - Number of wins of Hard Effort and Probability of 12%'.


***Hard Effort and 12%: Proportion of Wins***.
IF Missing(Hard_Prob12_WIN)=0
Hard_Prob12_WIN_PCT = Hard_Prob12_WIN / Count_Hard_Prob12.
EXECUTE.

RECODE Hard_Prob12_WIN_PCT (MISSING=-999).
EXECUTE.

MISSING VALUES Hard_Prob12_WIN_PCT (-999).

VARIABLE LABELS Hard_Prob12_WIN_PCT 'EEFRT - Percentage of wins among Hard Effort and Probability of 12%'.


******Hard Effort & Probabilty of 50%*****.
*****Count Hard Effort and 50%*****.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=50
Count_Hard_Prob50=1.
EXECUTE.

SORT CASES BY ID(A) Count_Hard_Prob50(D).

IF ID=lag(ID) & Choice=1 & Probability=50
Count_Hard_Prob50=SUM(Count_Hard_Prob50,lag(Count_Hard_Prob50)).
EXECUTE.

SORT CASES BY ID(A) Count_Hard_Prob50(D).

IF ID=lag(ID)
Count_Hard_Prob50=lag(Count_Hard_Prob50).
EXECUTE.

RECODE Count_Hard_Prob50 (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_Hard_Prob50 'EEFRT - Count of Hard Effort and Probability of 50%'.

***Proportion of Hard Effort in Probability of 50%***.
COMPUTE Hard_Prob50_Prop=Count_Hard_Prob50 / Count_Prob50.
EXECUTE.

VARIABLE LABELS Hard_Prob50_Prop 'EEFRT - Proportion of Hard Effort and and Probability of 50%'.

***Hard Effort and 50%: Reward Magnitude***.
SORT CASES BY ID(A) Trials(A).
IF Choice=1 & Probability=50 Hard_Prob50_RM=Amount.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob50_RM(D).
IF ID=lag(ID) & Choice=1 & Probability=50
Hard_Prob50_RM=SUM(Hard_Prob50_RM,lag(Hard_Prob50_RM)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob50_RM(D).
IF ID=lag(ID)
Hard_Prob50_RM=lag(Hard_Prob50_RM).
EXECUTE.

RECODE Hard_Prob50_RM (MISSING=0).
EXECUTE.

VARIABLE LABELS Hard_Prob50_RM 'EEFRT - Reward Magnitude of Hard Effort and Probability of 50%'.


***Hard Effort and 50%: Expected Value***.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=50 
Hard_Prob50_EV=Amount * Probability / 100.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob50_EV(D).

IF ID=lag(ID) & Choice=1 & Probability=50
Hard_Prob50_EV=SUM(Hard_Prob50_EV,lag(Hard_Prob50_EV)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob50_EV(D).

IF ID=lag(ID) 
Hard_Prob50_EV=lag(Hard_Prob50_EV).
EXECUTE.

RECODE Hard_Prob50_EV (MISSING=0).
EXECUTE.

VARIABLE LABELS Hard_Prob50_EV 'EEFRT - Expected Value of Hard Effort and Probability of 50%'.


***Hard Effort and 50%: Reaction Time***.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=50 
Hard_Prob50_RT=Decision.RT.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob50_RT(D).

IF ID=lag(ID) & Choice=1 & Probability=50
Hard_Prob50_RT=SUM(Hard_Prob50_RT,lag(Hard_Prob50_RT)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob50_RT(D).

IF ID=lag(ID) 
Hard_Prob50_RT=lag(Hard_Prob50_RT).
EXECUTE.

RECODE Hard_Prob50_RT (MISSING=-999).
EXECUTE.

MISSING VALUES Hard_Prob50_RT (-999).

VARIABLE LABELS Hard_Prob50_RT 'EEFRT - Reaction Time of Hard Effort and Probability of 50%'.

***Hard Effort and 50%: Tap Speed***.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=50 
Hard_Prob50_TS=TapSpeed.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob50_TS(D).

IF ID=lag(ID) & Choice=1 & Probability=50
Hard_Prob50_TS=SUM(Hard_Prob50_TS,lag(Hard_Prob50_TS)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob50_TS(D).

IF ID=lag(ID) 
Hard_Prob50_TS=lag(Hard_Prob50_TS).
EXECUTE.

RECODE Hard_Prob50_TS (MISSING=-999).
EXECUTE.

MISSING VALUES Hard_Prob50_TS (-999).

VARIABLE LABELS Hard_Prob50_TS 'EEFTS - Tap Speed of Hard Effort and Probability of 50%'.

FORMATS Hard_Prob50_TS(F8.5).

***Hard Effort and 50%: Winnings Amount***.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=50 
Hard_Prob50_WIN_AMT=Winnings.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob50_WIN_AMT(D).

IF ID=lag(ID) & Choice=1 & Probability=50
Hard_Prob50_WIN_AMT=SUM(Hard_Prob50_WIN_AMT,lag(Hard_Prob50_WIN_AMT)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob50_WIN_AMT(D).

IF ID=lag(ID) 
Hard_Prob50_WIN_AMT=lag(Hard_Prob50_WIN_AMT).
EXECUTE.

RECODE Hard_Prob50_WIN_AMT (MISSING=-999).
EXECUTE.

MISSING VALUES Hard_Prob50_WIN_AMT (-999).

VARIABLE LABELS Hard_Prob50_WIN_AMT 'EEFTS - Winnings Amount of Hard Effort and Probability of 50%'.

***Hard Effort and 50%: Number of Wins***.
SORT CASES BY ID(A) Trials(A).
IF Choice=1 & Probability=50 & Procedure_R=1
Hard_Prob50_WIN=1.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob50_WIN(D).

IF ID=lag(ID) & Choice=1 & Probability=50 & Procedure_R=1
Hard_Prob50_WIN=SUM(Hard_Prob50_WIN,lag(Hard_Prob50_WIN)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob50_WIN(D).

IF ID=lag(ID) 
Hard_Prob50_WIN=lag(Hard_Prob50_WIN).
EXECUTE.

DO IF (Hard_Prob50_EV > 0).
RECODE Hard_Prob50_WIN (SYSMIS=0).
END IF.
EXECUTE.

DO IF (Hard_Prob50_EV = 0).
RECODE Hard_Prob50_WIN (SYSMIS=-999).
END IF.
EXECUTE.

MISSING VALUES Hard_Prob50_WIN (-999).

VARIABLE LABELS Hard_Prob50_WIN 'EEFRT - Number of wins of Hard Effort and Probability of 50%'.


***Hard Effort and 50%: Proportion of Wins***.
IF Missing(Hard_Prob50_WIN)=0
Hard_Prob50_WIN_PCT = Hard_Prob50_WIN / Count_Hard_Prob50.
EXECUTE.

RECODE Hard_Prob50_WIN_PCT (MISSING=-999).
EXECUTE.

MISSING VALUES Hard_Prob50_WIN_PCT (-999).

VARIABLE LABELS Hard_Prob50_WIN_PCT 'EEFRT - Percentage of wins among Hard Effort and Probability of 50%'.


******Hard Effort & Probabilty of 88%*****.

*****Count Hard Effort and 88%*****.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=88
Count_Hard_Prob88=1.
EXECUTE.

SORT CASES BY ID(A) Count_Hard_Prob88(D).

IF ID=lag(ID) & Choice=1 & Probability=88
Count_Hard_Prob88=SUM(Count_Hard_Prob88,lag(Count_Hard_Prob88)).
EXECUTE.

SORT CASES BY ID(A) Count_Hard_Prob88(D).

IF ID=lag(ID)
Count_Hard_Prob88=lag(Count_Hard_Prob88).
EXECUTE.

RECODE Count_Hard_Prob88 (MISSING=0).
EXECUTE.

VARIABLE LABELS Count_Hard_Prob88 'EEFRT - Count of Hard Effort and Probability of 88%'.

***Proportion of Hard Effort in Probability of 88%***.
COMPUTE Hard_Prob88_Prop=Count_Hard_Prob88 / Count_Prob88.
EXECUTE.

VARIABLE LABELS Hard_Prob88_Prop 'EEFRT - Proportion of Hard Effort and and Probability of 88%'.

***Hard Effort and 88%: Reward Magnitude***.
SORT CASES BY ID(A) Trials(A).
IF Choice=1 & Probability=88 Hard_Prob88_RM=Amount.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob88_RM(D).
IF ID=lag(ID) & Choice=1 & Probability=88
Hard_Prob88_RM=SUM(Hard_Prob88_RM,lag(Hard_Prob88_RM)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob88_RM(D).
IF ID=lag(ID)
Hard_Prob88_RM=lag(Hard_Prob88_RM).
EXECUTE.

RECODE Hard_Prob88_RM (MISSING=0).
EXECUTE.

VARIABLE LABELS Hard_Prob88_RM 'EEFRT - Reward Magnitude of Hard Effort and Probability of 88%'.


***Hard Effort and 88%: Expected Value***.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=88 
Hard_Prob88_EV=Amount * Probability / 100.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob88_EV(D).

IF ID=lag(ID) & Choice=1 & Probability=88
Hard_Prob88_EV=SUM(Hard_Prob88_EV,lag(Hard_Prob88_EV)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob88_EV(D).

IF ID=lag(ID) 
Hard_Prob88_EV=lag(Hard_Prob88_EV).
EXECUTE.

RECODE Hard_Prob88_EV (MISSING=0).
EXECUTE.

VARIABLE LABELS Hard_Prob88_EV 'EEFRT - Expected Value of Hard Effort and Probability of 88%'.


***Hard Effort and 88%: Reaction Time***.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=88 
Hard_Prob88_RT=Decision.RT.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob88_RT(D).

IF ID=lag(ID) & Choice=1 & Probability=88
Hard_Prob88_RT=SUM(Hard_Prob88_RT,lag(Hard_Prob88_RT)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob88_RT(D).

IF ID=lag(ID) 
Hard_Prob88_RT=lag(Hard_Prob88_RT).
EXECUTE.

RECODE Hard_Prob88_RT (MISSING=-999).
EXECUTE.

MISSING VALUES Hard_Prob88_RT (-999).

VARIABLE LABELS Hard_Prob88_RT 'EEFRT - Reaction Time of Hard Effort and Probability of 88%'.

***Hard Effort and 88%: Tap Speed***.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=88 
Hard_Prob88_TS=TapSpeed.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob88_TS(D).

IF ID=lag(ID) & Choice=1 & Probability=88
Hard_Prob88_TS=SUM(Hard_Prob88_TS,lag(Hard_Prob88_TS)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob88_TS(D).

IF ID=lag(ID) 
Hard_Prob88_TS=lag(Hard_Prob88_TS).
EXECUTE.

RECODE Hard_Prob88_TS (MISSING=-999).
EXECUTE.

MISSING VALUES Hard_Prob88_TS (-999).

VARIABLE LABELS Hard_Prob88_TS 'EEFTS - Tap Speed of Hard Effort and Probability of 88%'.

FORMATS Hard_Prob88_TS(F8.5).

***Hard Effort and 88%: Winnings Amount***.
SORT CASES BY ID(A) Trials(A).

IF Choice=1 & Probability=88 
Hard_Prob88_WIN_AMT=Winnings.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob88_WIN_AMT(D).

IF ID=lag(ID) & Choice=1 & Probability=88
Hard_Prob88_WIN_AMT=SUM(Hard_Prob88_WIN_AMT,lag(Hard_Prob88_WIN_AMT)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob88_WIN_AMT(D).

IF ID=lag(ID) 
Hard_Prob88_WIN_AMT=lag(Hard_Prob88_WIN_AMT).
EXECUTE.

RECODE Hard_Prob88_WIN_AMT (MISSING=-999).
EXECUTE.

MISSING VALUES Hard_Prob88_WIN_AMT (-999).

VARIABLE LABELS Hard_Prob88_WIN_AMT 'EEFTS - Winnings Amount of Hard Effort and Probability of 88%'.

***Hard Effort and 88%: Number of Wins***.
SORT CASES BY ID(A) Trials(A).
IF Choice=1 & Probability=88 & Procedure_R=1
Hard_Prob88_WIN=1.
EXECUTE.

SORT CASES BY ID(A) Hard_Prob88_WIN(D).

IF ID=lag(ID) & Choice=1 & Probability=88 & Procedure_R=1
Hard_Prob88_WIN=SUM(Hard_Prob88_WIN,lag(Hard_Prob88_WIN)).
EXECUTE.

SORT CASES BY ID(A) Hard_Prob88_WIN(D).

IF ID=lag(ID) 
Hard_Prob88_WIN=lag(Hard_Prob88_WIN).
EXECUTE.

DO IF (Hard_Prob88_EV > 0).
RECODE Hard_Prob88_WIN (SYSMIS=0).
END IF.
EXECUTE.

DO IF (Hard_Prob88_EV = 0).
RECODE Hard_Prob88_WIN (SYSMIS=-999).
END IF.
EXECUTE.

MISSING VALUES Hard_Prob88_WIN (-999).

VARIABLE LABELS Hard_Prob88_WIN 'EEFRT - Number of wins of Hard Effort and Probability of 88%'.


***Hard Effort and 88%: Proportion of Wins***.
IF Missing(Hard_Prob88_WIN)=0
Hard_Prob88_WIN_PCT = Hard_Prob88_WIN / Count_Hard_Prob88.
EXECUTE.

RECODE Hard_Prob88_WIN_PCT (MISSING=-999).
EXECUTE.

MISSING VALUES Hard_Prob88_WIN_PCT (-999).

VARIABLE LABELS Hard_Prob88_WIN_PCT 'EEFRT - Percentage of wins among Hard Effort and Probability of 88%'.




****Rename variables***.
RENAME VARIABLES Count_Completed = EEFRT_Count_Completed.
RENAME VARIABLES Count_NotCompleted = EEFRT_Count_NotCompleted.
RENAME VARIABLES CompletionRate = EEFRT_CompletionRate.
RENAME VARIABLES Count_Easy = EEFRT_Count_Easy.
RENAME VARIABLES Count_Hard = EEFRT_Count_Hard.
RENAME VARIABLES Count_Unchosen = EEFRT_Count_Unchosen.
RENAME VARIABLES Pct_Hard_Effort = EEFRT_Pct_Hard_Effort.
RENAME VARIABLES Pct_Easy_Effort = EEFRT_Pct_Easy_Effort.
RENAME VARIABLES Count_Win = EEFRT_Count_Win.
RENAME VARIABLES Count_Lose = EEFRT_Count_Lose.
RENAME VARIABLES Count_Prob12 = EEFRT_Count_Prob12.
RENAME VARIABLES Count_Prob50 = EEFRT_Count_Prob50.
RENAME VARIABLES Count_Prob88 = EEFRT_Count_Prob88.
RENAME VARIABLES Pct_Prob12 = EEFRT_Pct_Prob12.
RENAME VARIABLES Pct_Prob50 = EEFRT_Pct_Prob50.
RENAME VARIABLES Pct_Prob88 = EEFRT_Pct_Prob88.
RENAME VARIABLES Overall_RM = EEFRT_Overall_RM.
RENAME VARIABLES Overall_EV = EEFRT_Overall_EV.
RENAME VARIABLES Overall_RT = EEFRT_Overall_RT.
RENAME VARIABLES Overall_TS = EEFRT_Overall_TS.
RENAME VARIABLES Overall_WIN_AMT = EEFRT_Overall_WIN_AMT.
RENAME VARIABLES Overall_WIN_PCT = EEFRT_Overall_WIN_PCT.
RENAME VARIABLES Count_Hard_Prob12 = EEFRT_Count_Hard_Prob12.
RENAME VARIABLES Hard_Prob12_Prop = EEFRT_Hard_Prob12_Prop.
RENAME VARIABLES Hard_Prob12_RM = EEFRT_Hard_Prob12_RM.
RENAME VARIABLES Hard_Prob12_EV = EEFRT_Hard_Prob12_EV.
RENAME VARIABLES Hard_Prob12_RT = EEFRT_Hard_Prob12_RT.
RENAME VARIABLES Hard_Prob12_TS = EEFRT_Hard_Prob12_TS.
RENAME VARIABLES Hard_Prob12_WIN_AMT = EEFRT_Hard_Prob12_WIN_AMT.
RENAME VARIABLES Hard_Prob12_WIN = EEFRT_Hard_Prob12_WIN.
RENAME VARIABLES Hard_Prob12_WIN_PCT = EEFRT_Hard_Prob12_WIN_PCT.
RENAME VARIABLES Count_Hard_Prob50 = EEFRT_Count_Hard_Prob50.
RENAME VARIABLES Hard_Prob50_Prop = EEFRT_Hard_Prob50_Prop.
RENAME VARIABLES Hard_Prob50_RM = EEFRT_Hard_Prob50_RM.
RENAME VARIABLES Hard_Prob50_EV = EEFRT_Hard_Prob50_EV.
RENAME VARIABLES Hard_Prob50_RT = EEFRT_Hard_Prob50_RT.
RENAME VARIABLES Hard_Prob50_TS = EEFRT_Hard_Prob50_TS.
RENAME VARIABLES Hard_Prob50_WIN_AMT = EEFRT_Hard_Prob50_WIN_AMT.
RENAME VARIABLES Hard_Prob50_WIN = EEFRT_Hard_Prob50_WIN.
RENAME VARIABLES Hard_Prob50_WIN_PCT = EEFRT_Hard_Prob50_WIN_PCT.
RENAME VARIABLES Count_Hard_Prob88 = EEFRT_Count_Hard_Prob88.
RENAME VARIABLES Hard_Prob88_Prop = EEFRT_Hard_Prob88_Prop.
RENAME VARIABLES Hard_Prob88_RM = EEFRT_Hard_Prob88_RM.
RENAME VARIABLES Hard_Prob88_EV = EEFRT_Hard_Prob88_EV.
RENAME VARIABLES Hard_Prob88_RT = EEFRT_Hard_Prob88_RT.
RENAME VARIABLES Hard_Prob88_TS = EEFRT_Hard_Prob88_TS.
RENAME VARIABLES Hard_Prob88_WIN_AMT = EEFRT_Hard_Prob88_WIN_AMT.
RENAME VARIABLES Hard_Prob88_WIN = EEFRT_Hard_Prob88_WIN.
RENAME VARIABLES Hard_Prob88_WIN_PCT = EEFRT_Hard_Prob88_WIN_PCT.






