1    DATA PD;
2     SET Work.PD ;
3
4    proc sort nodupkey  ;  by  Subj_UID  ;
5
6    proc contents ;
7     title "DR ABBY OLSEN's CROSS-SECTIONAL STUDY OF COMORBIDITY RISK FACTORS FOR PD";
8     title2 'LOGISTIC REGRESSION PREDICTING PD WITH COVARIATES:Age & Sex';
9     TITLE5 'Variables in Full SAS DataSet';
10
11   proc ttest;
12    class Dx;
13    var Age;
14     title2 'T-Test on Dx Difference in Age';
15
16   proc freq ;
17     tables (Sex depress anxiety sleep_ap PLMS RBD MCI HTN HLD DM OA RA artery_dis
18   heart_fail hypothyroid asthma RLS acetamnphn baby aspirin Ibuprofen naproxen
19   celecoxib lovastatin simvastatin rosuvastatin pravastatin atorvastatin fluvastatin
20   ezetimibe_simva atenolol losartain duloxetine HCTZ lisinopril famotidine lansoprazole
21   omeprazole pantoprazole buproprion alprazolam ezetimibe sertraline head_trauma
22   neuroleptic encephal pesticides metal_poison ind_profess vegetrn coffee tea soda
23   alcohol smoked coenzyme creatine multivit glucosamine vita_E calcium vita_C zinc
24   vita_D antiemetic) * Dx /missprint chisq ;
25     title2 'Dx Difference in Variables';
26
27   PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
28     class Sex (REF = 'F') anxiety (REF = 'NO') depress (REF = 'NO') sleep_ap (REF = 'NO')
29   PLMS (REF = 'NO') RBD (REF = 'NO') MCI (REF = 'NO') HTN (REF = 'NO') HLD (REF = 'NO')
30   DM (REF = 'NO') OA (REF = 'NO') RA (REF = 'NO') artery_dis (REF = 'NO')
31   heart_fail (REF = 'NO') hypothyroid (REF = 'NO') asthma (REF = 'NO') RLS (REF = 'NO')
32   acetamnphn (REF = 'NO') baby (REF = 'NO') aspirin (REF = 'NO') Ibuprofen (REF = 'NO')
33   naproxen (REF = 'NO') celecoxib (REF = 'NO') lovastatin (REF = 'NO') simvastatin (REF = 'NO')
34   rosuvastatin (REF = 'NO') pravastatin (REF = 'NO') atorvastatin (REF = 'NO')
35   fluvastatin (REF = 'NO') ezetimibe_simva (REF = 'NO') atenolol (REF = 'NO') losartain (REF =
35 ! 'NO')
36   duloxetine (REF = 'NO') HCTZ (REF = 'NO') lisinopril (REF = 'NO') famotidine (REF = 'NO')
37   lansoprazole (REF = 'NO') omeprazole (REF = 'NO') pantoprazole (REF = 'NO') buproprion (REF =
37 ! 'NO')
38   alprazolam (REF = 'NO') ezetimibe (REF = 'NO') sertraline (REF = 'NO') head_trauma (REF = 'NO')
39   neuroleptic (REF = 'NO') encephal (REF = 'NO') pesticides (REF = 'NO') metal_poison (REF = 'NO')
40   ind_profess (REF = 'NO') vegetrn (REF = 'NO') coffee (REF = 'NO') tea (REF = 'NO')
41   soda (REF = 'NO') alcohol (REF = 'NO') smoked (REF = 'NO') coenzyme (REF = 'NO')
42   creatine (REF = 'NO') multivit (REF = 'NO') glucosamine (REF = 'NO') vita_E (REF = 'NO')
43   calcium (REF = 'NO') vita_C (REF = 'NO') zinc (REF = 'NO') vita_D (REF = 'NO')
44   antiemetic (REF = 'NO');
45    MODEL Dx(event='PD') =  Age Sex depress anxiety sleep_ap PLMS RBD MCI HTN HLD DM OA RA
45 ! artery_dis
46   heart_fail hypothyroid asthma RLS acetamnphn baby aspirin Ibuprofen naproxen
47   celecoxib lovastatin simvastatin rosuvastatin pravastatin atorvastatin fluvastatin
48   ezetimibe_simva atenolol losartain duloxetine HCTZ lisinopril famotidine lansoprazole
49   omeprazole pantoprazole buproprion alprazolam ezetimibe sertraline head_trauma
50   neuroleptic encephal pesticides metal_poison ind_profess vegetrn coffee tea soda
51   alcohol smoked coenzyme creatine multivit glucosamine vita_E calcium vita_C zinc
52   vita_D antiemetic
53          /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
54    *output  out=out  predicted=pred  xbeta=x ;
55   UNITS  Age =  1  5  10  ;
56   title 'Logistic Regression All Variables';
57   RUN;
57 !      QUIT;
58
59   PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
60     class Sex (REF = 'F') anxiety (REF = 'NO') ;
61    MODEL Dx(event='PD') =  Age Sex anxiety
62          /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
63    *output  out=out  predicted=pred  xbeta=x ;
64   UNITS  Age =  1  5  10  ;
65   title 'Logistic Regression Single Variable Controlled for Age and Sex';
66   RUN;
66 !      QUIT;
67
68   PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
69     class Sex (REF = 'F') depress (REF = 'NO') ;
70    MODEL Dx(event='PD') =  Age Sex depress
71          /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
72    *output  out=out  predicted=pred  xbeta=x ;
73   UNITS  Age =  1  5  10  ;
74   title 'Logistic Regression Single Variable Controlled for Age and Sex';
75   RUN;
75 !      QUIT;
76
77   PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
78     class Sex (REF = 'F') sleep_ap (REF = 'NO') ;
79    MODEL Dx(event='PD') =  Age Sex sleep_ap
80          /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
81    *output  out=out  predicted=pred  xbeta=x ;
82   UNITS  Age =  1  5  10  ;
83   title 'Logistic Regression Single Variable Controlled for Age and Sex';
84   RUN;
84 !      QUIT;
85
86   PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
87     class Sex (REF = 'F') PLMS (REF = 'NO') ;
88    MODEL Dx(event='PD') =  Age Sex PLMS
89          /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
90    *output  out=out  predicted=pred  xbeta=x ;
91   UNITS  Age =  1  5  10  ;
92   title 'Logistic Regression Single Variable Controlled for Age and Sex';
93   RUN;
93 !      QUIT;
94
95   PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
96     class Sex (REF = 'F') RBD (REF = 'NO') ;
97    MODEL Dx(event='PD') =  Age Sex RBD
98          /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
99    *output  out=out  predicted=pred  xbeta=x ;
100  UNITS  Age =  1  5  10  ;
101  title 'Logistic Regression Single Variable Controlled for Age and Sex';
102  RUN;
102!      QUIT;
103
104  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
105    class Sex (REF = 'F') MCI (REF = 'NO') ;
106   MODEL Dx(event='PD') =  Age Sex MCI
107         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
108   *output  out=out  predicted=pred  xbeta=x ;
109  UNITS  Age =  1  5  10  ;
110  title 'Logistic Regression Single Variable Controlled for Age and Sex';
111  RUN;
111!      QUIT;
112
113  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
114    class Sex (REF = 'F') HTN (REF = 'NO') ;
115   MODEL Dx(event='PD') =  Age Sex HTN
116         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
117   *output  out=out  predicted=pred  xbeta=x ;
118  UNITS  Age =  1  5  10  ;
119  title 'Logistic Regression Single Variable Controlled for Age and Sex';
120  RUN;
120!      QUIT;
121
122  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
123    class Sex (REF = 'F') HLD (REF = 'NO') ;
124   MODEL Dx(event='PD') =  Age Sex HLD
125         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
126   *output  out=out  predicted=pred  xbeta=x ;
127  UNITS  Age =  1  5  10  ;
128  title 'Logistic Regression Single Variable Controlled for Age and Sex';
129  RUN;
129!      QUIT;
130
131  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
132    class Sex (REF = 'F') DM (REF = 'NO') ;
133   MODEL Dx(event='PD') =  Age Sex DM
134         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
135   *output  out=out  predicted=pred  xbeta=x ;
136  UNITS  Age =  1  5  10  ;
137  title 'Logistic Regression Single Variable Controlled for Age and Sex';
138  RUN;
138!      QUIT;
139
140  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
141    class Sex (REF = 'F') OA (REF = 'NO') ;
142   MODEL Dx(event='PD') =  Age Sex OA
143         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
144   *output  out=out  predicted=pred  xbeta=x ;
145  UNITS  Age =  1  5  10  ;
146  title 'Logistic Regression Single Variable Controlled for Age and Sex';
147  RUN;
147!      QUIT;
148
149  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
150    class Sex (REF = 'F') RA (REF = 'NO') ;
151   MODEL Dx(event='PD') =  Age Sex RA
152         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
153   *output  out=out  predicted=pred  xbeta=x ;
154  UNITS  Age =  1  5  10  ;
155  title 'Logistic Regression Single Variable Controlled for Age and Sex';
156  RUN;
156!      QUIT;
157
158  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
159    class Sex (REF = 'F') artery_dis (REF = 'NO') ;
160   MODEL Dx(event='PD') =  Age Sex artery_dis
161         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
162   *output  out=out  predicted=pred  xbeta=x ;
163  UNITS  Age =  1  5  10  ;
164  title 'Logistic Regression Single Variable Controlled for Age and Sex';
165  RUN;
165!      QUIT;
166
167  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
168    class Sex (REF = 'F') heart_fail (REF = 'NO') ;
169   MODEL Dx(event='PD') =  Age Sex heart_fail
170         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
171   *output  out=out  predicted=pred  xbeta=x ;
172  UNITS  Age =  1  5  10  ;
173  title 'Logistic Regression Single Variable Controlled for Age and Sex';
174  RUN;
174!      QUIT;
175
176  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
177    class Sex (REF = 'F') hypothyroid (REF = 'NO') ;
178   MODEL Dx(event='PD') =  Age Sex hypothyroid
179         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
180   *output  out=out  predicted=pred  xbeta=x ;
181  UNITS  Age =  1  5  10  ;
182  title 'Logistic Regression Single Variable Controlled for Age and Sex';
183  RUN;
183!      QUIT;
184
185  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
186    class Sex (REF = 'F') asthma (REF = 'NO') ;
187   MODEL Dx(event='PD') =  Age Sex asthma
188         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
189   *output  out=out  predicted=pred  xbeta=x ;
190  UNITS  Age =  1  5  10  ;
191  title 'Logistic Regression Single Variable Controlled for Age and Sex';
192  RUN;
192!      QUIT;
193
194  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
195    class Sex (REF = 'F') RLS (REF = 'NO') ;
196   MODEL Dx(event='PD') =  Age Sex RLS
197         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
198   *output  out=out  predicted=pred  xbeta=x ;
199  UNITS  Age =  1  5  10  ;
200  title 'Logistic Regression Single Variable Controlled for Age and Sex';
201  RUN;
201!      QUIT;
202
203  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
204    class Sex (REF = 'F') acetamnphn (REF = 'NO') ;
205   MODEL Dx(event='PD') =  Age Sex acetamnphn
206         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
207   *output  out=out  predicted=pred  xbeta=x ;
208  UNITS  Age =  1  5  10  ;
209  title 'Logistic Regression Single Variable Controlled for Age and Sex';
210  RUN;
210!      QUIT;
211
212  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
213    class Sex (REF = 'F') baby (REF = 'NO') ;
214   MODEL Dx(event='PD') =  Age Sex baby
215         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
216   *output  out=out  predicted=pred  xbeta=x ;
217  UNITS  Age =  1  5  10  ;
218  title 'Logistic Regression Single Variable Controlled for Age and Sex';
219  RUN;
219!      QUIT;
220
221  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
222    class Sex (REF = 'F') aspirin (REF = 'NO') ;
223   MODEL Dx(event='PD') =  Age Sex aspirin
224         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
225   *output  out=out  predicted=pred  xbeta=x ;
226  UNITS  Age =  1  5  10  ;
227  title 'Logistic Regression Single Variable Controlled for Age and Sex';
228  RUN;
228!      QUIT;
229
230  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
231    class Sex (REF = 'F') Ibuprofen (REF = 'NO') ;
232   MODEL Dx(event='PD') =  Age Sex Ibuprofen
233         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
234   *output  out=out  predicted=pred  xbeta=x ;
235  UNITS  Age =  1  5  10  ;
236  title 'Logistic Regression Single Variable Controlled for Age and Sex';
237  RUN;
237!      QUIT;
238
239  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
240    class Sex (REF = 'F') naproxen (REF = 'NO') ;
241   MODEL Dx(event='PD') =  Age Sex naproxen
242         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
243   *output  out=out  predicted=pred  xbeta=x ;
244  UNITS  Age =  1  5  10  ;
245  title 'Logistic Regression Single Variable Controlled for Age and Sex';
246  RUN;
246!      QUIT;
247
248  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
249    class Sex (REF = 'F') celecoxib (REF = 'NO') ;
250   MODEL Dx(event='PD') =  Age Sex celecoxib
251         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
252   *output  out=out  predicted=pred  xbeta=x ;
253  UNITS  Age =  1  5  10  ;
254  title 'Logistic Regression Single Variable Controlled for Age and Sex';
255  RUN;
255!      QUIT;
256
257  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
258    class Sex (REF = 'F') lovastatin (REF = 'NO') ;
259   MODEL Dx(event='PD') =  Age Sex lovastatin
260         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
261   *output  out=out  predicted=pred  xbeta=x ;
262  UNITS  Age =  1  5  10  ;
263  title 'Logistic Regression Single Variable Controlled for Age and Sex';
264  RUN;
264!      QUIT;
265
266  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
267    class Sex (REF = 'F') simvastatin (REF = 'NO') ;
268   MODEL Dx(event='PD') =  Age Sex simvastatin
269         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
270   *output  out=out  predicted=pred  xbeta=x ;
271  UNITS  Age =  1  5  10  ;
272  title 'Logistic Regression Single Variable Controlled for Age and Sex';
273  RUN;
273!      QUIT;
274
275  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
276    class Sex (REF = 'F') rosuvastatin (REF = 'NO') ;
277   MODEL Dx(event='PD') =  Age Sex rosuvastatin
278         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
279   *output  out=out  predicted=pred  xbeta=x ;
280  UNITS  Age =  1  5  10  ;
281  title 'Logistic Regression Single Variable Controlled for Age and Sex';
282  RUN;
282!      QUIT;
283
284
285  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
286    class Sex (REF = 'F') pravastatin (REF = 'NO') ;
287   MODEL Dx(event='PD') =  Age Sex pravastatin
288         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
289   *output  out=out  predicted=pred  xbeta=x ;
290  UNITS  Age =  1  5  10  ;
291  title 'Logistic Regression Single Variable Controlled for Age and Sex';
292  RUN;
292!      QUIT;
293
294
295  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
296    class Sex (REF = 'F') atorvastatin (REF = 'NO') ;
297   MODEL Dx(event='PD') =  Age Sex atorvastatin
298         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
299   *output  out=out  predicted=pred  xbeta=x ;
300  UNITS  Age =  1  5  10  ;
301  title 'Logistic Regression Single Variable Controlled for Age and Sex';
302  RUN;
302!      QUIT;
303
304
305  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
306    class Sex (REF = 'F') fluvastatin (REF = 'NO') ;
307   MODEL Dx(event='PD') =  Age Sex fluvastatin
308         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
309   *output  out=out  predicted=pred  xbeta=x ;
310  UNITS  Age =  1  5  10  ;
311  title 'Logistic Regression Single Variable Controlled for Age and Sex';
312  RUN;
312!      QUIT;
313
314
315  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
316    class Sex (REF = 'F') ezetimibe_simva (REF = 'NO') ;
317   MODEL Dx(event='PD') =  Age Sex ezetimibe_simva
318         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
319   *output  out=out  predicted=pred  xbeta=x ;
320  UNITS  Age =  1  5  10  ;
321  title 'Logistic Regression Single Variable Controlled for Age and Sex';
322  RUN;
322!      QUIT;
323
324  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
325    class Sex (REF = 'F') atenolol (REF = 'NO') ;
326   MODEL Dx(event='PD') =  Age Sex atenolol
327         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
328   *output  out=out  predicted=pred  xbeta=x ;
329  UNITS  Age =  1  5  10  ;
330  title 'Logistic Regression Single Variable Controlled for Age and Sex';
331  RUN;
331!      QUIT;
332
333  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
334    class Sex (REF = 'F') losartain (REF = 'NO') ;
335   MODEL Dx(event='PD') =  Age Sex losartain
336         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
337   *output  out=out  predicted=pred  xbeta=x ;
338  UNITS  Age =  1  5  10  ;
339  title 'Logistic Regression Single Variable Controlled for Age and Sex';
340  RUN;
340!      QUIT;
341
342  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
343    class Sex (REF = 'F') duloxetine (REF = 'NO') ;
344   MODEL Dx(event='PD') =  Age Sex duloxetine
345         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
346   *output  out=out  predicted=pred  xbeta=x ;
347  UNITS  Age =  1  5  10  ;
348  title 'Logistic Regression Single Variable Controlled for Age and Sex';
349  RUN;
349!      QUIT;
350
351  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
352    class Sex (REF = 'F') HCTZ (REF = 'NO') ;
353   MODEL Dx(event='PD') =  Age Sex HCTZ
354         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
355   *output  out=out  predicted=pred  xbeta=x ;
356  UNITS  Age =  1  5  10  ;
357  title 'Logistic Regression Single Variable Controlled for Age and Sex';
358  RUN;
358!      QUIT;
359
360  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
361    class Sex (REF = 'F') lisinopril (REF = 'NO') ;
362   MODEL Dx(event='PD') =  Age Sex lisinopril
363         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
364   *output  out=out  predicted=pred  xbeta=x ;
365  UNITS  Age =  1  5  10  ;
366  title 'Logistic Regression Single Variable Controlled for Age and Sex';
367  RUN;
367!      QUIT;
368
369  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
370    class Sex (REF = 'F') famotidine (REF = 'NO') ;
371   MODEL Dx(event='PD') =  Age Sex famotidine
372         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
373   *output  out=out  predicted=pred  xbeta=x ;
374  UNITS  Age =  1  5  10  ;
375  title 'Logistic Regression Single Variable Controlled for Age and Sex';
376  RUN;
376!      QUIT;
377
378  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
379    class Sex (REF = 'F') ezetimibe_simva (REF = 'NO') ;
380   MODEL Dx(event='PD') =  Age Sex ezetimibe_simva
381         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
382   *output  out=out  predicted=pred  xbeta=x ;
383  UNITS  Age =  1  5  10  ;
384  title 'Logistic Regression Single Variable Controlled for Age and Sex';
385  RUN;
385!      QUIT;
386
387  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
388    class Sex (REF = 'F') lansoprazole (REF = 'NO') ;
389   MODEL Dx(event='PD') =  Age Sex lansoprazole
390         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
391   *output  out=out  predicted=pred  xbeta=x ;
392  UNITS  Age =  1  5  10  ;
393  title 'Logistic Regression Single Variable Controlled for Age and Sex';
394  RUN;
394!      QUIT;
395
396  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
397    class Sex (REF = 'F') pantoprazole (REF = 'NO') ;
398   MODEL Dx(event='PD') =  Age Sex pantoprazole
399         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
400   *output  out=out  predicted=pred  xbeta=x ;
401  UNITS  Age =  1  5  10  ;
402  title 'Logistic Regression Single Variable Controlled for Age and Sex';
403  RUN;
403!      QUIT;
404
405  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
406    class Sex (REF = 'F') omeprazole (REF = 'NO') ;
407   MODEL Dx(event='PD') =  Age Sex omeprazole
408         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
409   *output  out=out  predicted=pred  xbeta=x ;
410  UNITS  Age =  1  5  10  ;
411  title 'Logistic Regression Single Variable Controlled for Age and Sex';
412  RUN;
412!      QUIT;
413
414  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
415    class Sex (REF = 'F') buproprion (REF = 'NO') ;
416   MODEL Dx(event='PD') =  Age Sex buproprion
417         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
418   *output  out=out  predicted=pred  xbeta=x ;
419  UNITS  Age =  1  5  10  ;
420  title 'Logistic Regression Single Variable Controlled for Age and Sex';
421  RUN;
421!      QUIT;
422
423  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
424    class Sex (REF = 'F') alprazolam (REF = 'NO') ;
425   MODEL Dx(event='PD') =  Age Sex alprazolam
426         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
427   *output  out=out  predicted=pred  xbeta=x ;
428  UNITS  Age =  1  5  10  ;
429  title 'Logistic Regression Single Variable Controlled for Age and Sex';
430  RUN;
430!      QUIT;
431
432  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
433    class Sex (REF = 'F') ezetimibe (REF = 'NO') ;
434   MODEL Dx(event='PD') =  Age Sex ezetimibe
435         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
436   *output  out=out  predicted=pred  xbeta=x ;
437  UNITS  Age =  1  5  10  ;
438  title 'Logistic Regression Single Variable Controlled for Age and Sex';
439  RUN;
439!      QUIT;
440
441  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
442    class Sex (REF = 'F') sertraline (REF = 'NO') ;
443   MODEL Dx(event='PD') =  Age Sex sertraline
444         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
445   *output  out=out  predicted=pred  xbeta=x ;
446  UNITS  Age =  1  5  10  ;
447  title 'Logistic Regression Single Variable Controlled for Age and Sex';
448  RUN;
448!      QUIT;
449
450  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
451    class Sex (REF = 'F') head_trauma (REF = 'NO') ;
452   MODEL Dx(event='PD') =  Age Sex head_trauma
453         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
454   *output  out=out  predicted=pred  xbeta=x ;
455  UNITS  Age =  1  5  10  ;
456  title 'Logistic Regression Single Variable Controlled for Age and Sex';
457  RUN;
457!      QUIT;
458
459  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
460    class Sex (REF = 'F') neuroleptic (REF = 'NO') ;
461   MODEL Dx(event='PD') =  Age Sex neuroleptic
462         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
463   *output  out=out  predicted=pred  xbeta=x ;
464  UNITS  Age =  1  5  10  ;
465  title 'Logistic Regression Single Variable Controlled for Age and Sex';
466  RUN;
466!      QUIT;
467
468  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
469    class Sex (REF = 'F') encephal (REF = 'NO') ;
470   MODEL Dx(event='PD') =  Age Sex encephal
471         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
472   *output  out=out  predicted=pred  xbeta=x ;
473  UNITS  Age =  1  5  10  ;
474  title 'Logistic Regression Single Variable Controlled for Age and Sex';
475  RUN;
475!      QUIT;
476
477  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
478    class Sex (REF = 'F') pesticides (REF = 'NO') ;
479   MODEL Dx(event='PD') =  Age Sex pesticides
480         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
481   *output  out=out  predicted=pred  xbeta=x ;
482  UNITS  Age =  1  5  10  ;
483  title 'Logistic Regression Single Variable Controlled for Age and Sex';
484  RUN;
484!      QUIT;
485
486  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
487    class Sex (REF = 'F') metal_poison (REF = 'NO') ;
488   MODEL Dx(event='PD') =  Age Sex metal_poison
489         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
490   *output  out=out  predicted=pred  xbeta=x ;
491  UNITS  Age =  1  5  10  ;
492  title 'Logistic Regression Single Variable Controlled for Age and Sex';
493  RUN;
493!      QUIT;
494
495  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
496    class Sex (REF = 'F') ezetimibe_simva (REF = 'NO') ;
497   MODEL Dx(event='PD') =  Age Sex ezetimibe_simva
498         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
499   *output  out=out  predicted=pred  xbeta=x ;
500  UNITS  Age =  1  5  10  ;
501  title 'Logistic Regression Single Variable Controlled for Age and Sex';
502  RUN;
502!      QUIT;
503
504  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
505    class Sex (REF = 'F') ind_profess (REF = 'NO') ;
506   MODEL Dx(event='PD') =  Age Sex ind_profess
507         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
508   *output  out=out  predicted=pred  xbeta=x ;
509  UNITS  Age =  1  5  10  ;
510  title 'Logistic Regression Single Variable Controlled for Age and Sex';
511  RUN;
511!      QUIT;
512
513  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
514    class Sex (REF = 'F') vegetrn (REF = 'NO') ;
515   MODEL Dx(event='PD') =  Age Sex vegetrn
516         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
517   *output  out=out  predicted=pred  xbeta=x ;
518  UNITS  Age =  1  5  10  ;
519  title 'Logistic Regression Single Variable Controlled for Age and Sex';
520  RUN;
520!      QUIT;
521
522  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
523    class Sex (REF = 'F') coffee (REF = 'NO') ;
524   MODEL Dx(event='PD') =  Age Sex coffee
525         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
526   *output  out=out  predicted=pred  xbeta=x ;
527  UNITS  Age =  1  5  10  ;
528  title 'Logistic Regression Single Variable Controlled for Age and Sex';
529  RUN;
529!      QUIT;
530
531  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
532    class Sex (REF = 'F') tea (REF = 'NO') ;
533   MODEL Dx(event='PD') =  Age Sex tea
534         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
535   *output  out=out  predicted=pred  xbeta=x ;
536  UNITS  Age =  1  5  10  ;
537  title 'Logistic Regression Single Variable Controlled for Age and Sex';
538  RUN;
538!      QUIT;
539
540  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
541    class Sex (REF = 'F') soda (REF = 'NO') ;
542   MODEL Dx(event='PD') =  Age Sex soda
543         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
544   *output  out=out  predicted=pred  xbeta=x ;
545  UNITS  Age =  1  5  10  ;
546  title 'Logistic Regression Single Variable Controlled for Age and Sex';
547  RUN;
547!      QUIT;
548
549  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
550    class Sex (REF = 'F') alcohol (REF = 'NO') ;
551   MODEL Dx(event='PD') =  Age Sex alcohol
552         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
553   *output  out=out  predicted=pred  xbeta=x ;
554  UNITS  Age =  1  5  10  ;
555  title 'Logistic Regression Single Variable Controlled for Age and Sex';
556  RUN;
556!      QUIT;
557
558  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
559    class Sex (REF = 'F') smoked (REF = 'NO') ;
560   MODEL Dx(event='PD') =  Age Sex smoked
561         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
562   *output  out=out  predicted=pred  xbeta=x ;
563  UNITS  Age =  1  5  10  ;
564  title 'Logistic Regression Single Variable Controlled for Age and Sex';
565  RUN;
565!      QUIT;
566
567  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
568    class Sex (REF = 'F') coenzyme (REF = 'NO') ;
569   MODEL Dx(event='PD') =  Age Sex coenzyme
570         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
571   *output  out=out  predicted=pred  xbeta=x ;
572  UNITS  Age =  1  5  10  ;
573  title 'Logistic Regression Single Variable Controlled for Age and Sex';
574  RUN;
574!      QUIT;
575
576  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
577    class Sex (REF = 'F') creatine (REF = 'NO') ;
578   MODEL Dx(event='PD') =  Age Sex creatine
579         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
580   *output  out=out  predicted=pred  xbeta=x ;
581  UNITS  Age =  1  5  10  ;
582  title 'Logistic Regression Single Variable Controlled for Age and Sex';
583  RUN;
583!      QUIT;
584
585  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
586    class Sex (REF = 'F') multivit (REF = 'NO') ;
587   MODEL Dx(event='PD') =  Age Sex multivit
588         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
589   *output  out=out  predicted=pred  xbeta=x ;
590  UNITS  Age =  1  5  10  ;
591  title 'Logistic Regression Single Variable Controlled for Age and Sex';
592  RUN;
592!      QUIT;
593
594  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
595    class Sex (REF = 'F') glucosamine (REF = 'NO') ;
596   MODEL Dx(event='PD') =  Age Sex glucosamine
597         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
598   *output  out=out  predicted=pred  xbeta=x ;
599  UNITS  Age =  1  5  10  ;
600  title 'Logistic Regression Single Variable Controlled for Age and Sex';
601  RUN;
601!      QUIT;
602
603  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
604    class Sex (REF = 'F') vita_E (REF = 'NO') ;
605   MODEL Dx(event='PD') =  Age Sex vita_E
606         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
607   *output  out=out  predicted=pred  xbeta=x ;
608  UNITS  Age =  1  5  10  ;
609  title 'Logistic Regression Single Variable Controlled for Age and Sex';
610  RUN;
610!      QUIT;
611
612  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
613    class Sex (REF = 'F') calcium (REF = 'NO') ;
614   MODEL Dx(event='PD') =  Age Sex calcium
615         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
616   *output  out=out  predicted=pred  xbeta=x ;
617  UNITS  Age =  1  5  10  ;
618  title 'Logistic Regression Single Variable Controlled for Age and Sex';
619  RUN;
619!      QUIT;
620
621  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
622    class Sex (REF = 'F') vita_C (REF = 'NO') ;
623   MODEL Dx(event='PD') =  Age Sex vita_C
624         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
625   *output  out=out  predicted=pred  xbeta=x ;
626  UNITS  Age =  1  5  10  ;
627  title 'Logistic Regression Single Variable Controlled for Age and Sex';
628  RUN;
628!      QUIT;
629
630  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
631    class Sex (REF = 'F') zinc (REF = 'NO') ;
632   MODEL Dx(event='PD') =  Age Sex zinc
633         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
634   *output  out=out  predicted=pred  xbeta=x ;
635  UNITS  Age =  1  5  10  ;
636  title 'Logistic Regression Single Variable Controlled for Age and Sex';
637  RUN;
637!      QUIT;
638
639  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
640    class Sex (REF = 'F') vita_D (REF = 'NO') ;
641   MODEL Dx(event='PD') =  Age Sex vita_D
642         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
643   *output  out=out  predicted=pred  xbeta=x ;
644  UNITS  Age =  1  5  10  ;
645  title 'Logistic Regression Single Variable Controlled for Age and Sex';
646  RUN;
646!      QUIT;
647
648  PROC LOGISTIC data=PD PLOTS=(EFFECT ROC ODDSRATIO)  ;
649    class Sex (REF = 'F') antiemetic (REF = 'NO') ;
650   MODEL Dx(event='PD') =  Age Sex antiemetic
651         /  clodds=pl  clparm=pl   expb  rsquare  stb   LackFit  ;
652   *output  out=out  predicted=pred  xbeta=x ;
653  UNITS  Age =  1  5  10  ;
654  title 'Logistic Regression Single Variable Controlled for Age and Sex';
655  RUN;
655!      QUIT;
656
657  run; quit; run;