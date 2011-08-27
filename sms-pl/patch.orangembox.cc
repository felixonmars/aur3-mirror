58c58
< 		form.AddField("_DARGS", "/gear/static/signIn.jsp");
---
> 		form.AddField("_DARGS", "/gear/static/signInLoginBox.jsp");
60c60
< 		status = curl.PerformPost("https://www.orange.pl/portal/map/map/signin?_DARGS=/gear/static/signIn.jsp",
---
> 		status = curl.PerformPost("https://www.orange.pl/portal/map/map/signin?_DARGS=/gear/static/signInLoginBox.jsp",
62c62
< 		if (status) throw Exception("[2] - https://www.orange.pl/portal/map/map/signin?_DARGS=/gear/static/signIn.jsp");
---
> 		if (status) throw Exception("[2] - https://www.orange.pl/portal/map/map/signin?_DARGS=/gear/static/signInLoginBox.jsp");
71c71
< 		if (PcreWrap::pcre_match_all("<span class=\"label\">darmowe:</span>.*<span class=\"value\">([0-9]+)</span>", 
---
> 		if (PcreWrap::pcre_match_all("<span class=\"label\">bezpłatne:</span>.*<span class=\"value\">([0-9]+)</span>", 
79c79
< 		} else if (PcreWrap::pcre_match_all("<span class=\"label\">darmowe:.*>([0-9]+)<.*?z do..adowa..:.*>([0-9]+)<",
---
> 		} else if (PcreWrap::pcre_match_all("<span class=\"label\">bezpłatne:.*>([0-9]+)<.*?z do..adowa..:.*>([0-9]+)<",
131c131
< 		if (PcreWrap::pcre_match_all("<span class=\"label\">darmowe:.*>([0-9]+)<.*?z do..adowa..:.*>([0-9]+)<", 
---
> 		if (PcreWrap::pcre_match_all("<span class=\"label\">bezpłatne:.*>([0-9]+)<.*?z do..adowa..:.*>([0-9]+)<", 
138c138
< 		} else if (PcreWrap::pcre_match_all("<span class=\"label\">darmowe:</span>.*<span class=\"value\">([0-9]+)</span>",
---
> 		} else if (PcreWrap::pcre_match_all("<span class=\"label\">bezpłatne:</span>.*<span class=\"value\">([0-9]+)</span>",
218c218
< 		form.AddField("_DARGS", "/gear/static/signIn.jsp");
---
> 		form.AddField("_DARGS", "/gear/static/signInLoginBox.jsp");
220c220
< 		status = curl.PerformPost("https://www.orange.pl/portal/map/map/signin?_DARGS=/gear/static/signIn.jsp",
---
> 		status = curl.PerformPost("https://www.orange.pl/portal/map/map/signin?_DARGS=/gear/static/signInLoginBox.jsp",
222c222
< 		if (status) throw Exception("[2] - https://www.orange.pl/portal/map/map/signin?_DARGS=/gear/static/signIn.jsp");
---
> 		if (status) throw Exception("[2] - https://www.orange.pl/portal/map/map/signin?_DARGS=/gear/static/signInLoginBox.jsp");
231c231
< 		if (PcreWrap::pcre_match_all("<span class=\"label\">darmowe:</span>.*<span class=\"value\">([0-9]+)</span>", 
---
> 		if (PcreWrap::pcre_match_all("<span class=\"label\">bezpłatne:</span>.*<span class=\"value\">([0-9]+)</span>", 
233,234c233,234
< 			cout << "Darmowe: " << match[0][0] << endl;
< 		} else if (PcreWrap::pcre_match_all("<span class=\"label\">darmowe:.*>([0-9]+)<.*?z do..adowa..:.*>([0-9]+)<",
---
> 			cout << "bezpłatne: " << match[0][0] << endl;
> 		} else if (PcreWrap::pcre_match_all("<span class=\"label\">bezpłatne:.*>([0-9]+)<.*?z do..adowa..:.*>([0-9]+)<",
236c236
< 			cout << "Darmowe: " << match[0][0] << ", płatne: " << match[0][1] << endl;
---
> 			cout << "bezpłatne: " << match[0][0] << ", płatne: " << match[0][1] << endl;
