<h3>This is a public API for doctors and insurance information in a 10-mile radius of San Francisco, CA,
that I put together for my application <a>https://doctorsearch.herokuapp.com</a><br><a>https://github.com/Joshua-Pearson/DoctorSearch</a>.<br><br>

I started and finished this API as well as the project mentioned above, all in one week, for my final graduating project for www.generalassemb.ly<br><br>

This API is hosted for free to use as you see fit using <a>http://doctorstats.herokuapp.com/api/v1/</a> as the base URL.<br><br></h3>
<h4> In order to use the API I have some routes based on the insurance policies accepted by each doctor.<br><br></h4>

``
http://doctorstats.herokuapp.com/api/v1/doctors.json
``
<br>
will return a list of every doctor accepting Covered California that I was able to get off each insurance company's site.
<br><br>

``
http://doctorstats.herokuapp.com/api/v1/cchp.json
``
<br>
will return only those doctors that accept Covered California that I was able to scrape off of the Chinese Community Health Plan directory.
<br><br>
``
http://doctorstats.herokuapp.com/api/v1/blue_cross.json
``
<br>
will return only those doctors that accept Covered California PPOs and EPOs that are included in the Blue Cross doctor directory website.
<br><br>
``
http://doctorstats.herokuapp.com/api/v1/blue_cross_HMO.json
``
<br>
will return only those doctors that accept Covered California HMOs that are included in the Blue Cross doctor directory website.
<br><br>
``
http://doctorstats.herokuapp.com/api/v1/blue_shield.json
``
<br>
will return only those doctors that accept Covered California PPOs that are included in the Blue Shield doctor directory website.
<br><br>
``
http://doctorstats.herokuapp.com/api/v1/blue_shield_EPO.json
``
<br>
will return only those doctors that accept Covered California EPOs that are included in the Blue Shield doctor directory website. And finally
<br><br>
``
http://doctorstats.herokuapp.com/api/v1/kaiser.json
``
<br>
will return only those doctors that accept Covered California that are included in the Kaiser doctor directory website and accepting new patients.<br><br>

<h5> Finally in addition to making each insurance company searchable by route, this API also allows one search by doctor name, doctor specialty or doctor medical group while still filtering by insurance, through url query parameters. A few sample GET requests would be</h5><br>

``
http://doctorstats.herokuapp.com/api/v1/doctors.json?name=smith 
``
<br>
this would return all doctors with first or last name of smith.
<br><br>
``
http://doctorstats.herokuapp.com/api/v1/cchp.json?specialty=Radiology
``
<br>
would return all doctors that specialize in Radiology that are included in the CCHP insurance plan.
<br><br>
``
http://doctorstats.herokuapp.com/api/v1/blue_shield_EPO.json?medicalgroup=one%20medical%20plaza 
``
<br>
would include all doctors a part of that medical group that accept Blue Shield EPOs.</p><br>

<h5> If more than one search parameter is entered it will only search by the first parameter in order of importance as shown above. Also if the search parameter doesn't follow that syntax correctly, the search may display incorrect results.</h5><br><br>


<h6>I started building this API by using <a>www.import.io</a>, which is a fabulous piece of software, to scrape <a>www.healthpocket.com</a> for a basic list of doctors. However, I wasn't satisfied with the results which didn't seem completely accurate or up to date, 
so I decided to take erase my database, take matters into my own hands and make my own ruby scripts that required <a>https://github.com/watir/watir</a> or (<a>www.watir.com</a>) to scrape most of this information from <a>https://www.anthem.com</a>, <a>https://www.blueshieldca.com</a>, <a>http://www.cchphmo.com/</a> and <a>https://healthy.kaiserpermanente.org</a>. Special thanks to the Watir and Import.io people for making amazing products.</h6> 

<p>The inspiration behind putting this API together is that with the new Affordable Care Act I think it is paramount that people are aware of the doctors available for their specific health plan before deciding on what insurance plan to buy. Unfortunately the health care industry doesn't make this information easy to access, or have a public
API that would facilitate better apps than this. Please help me push for more transparency in 
the health care industry. Transparency is crucial, we need an API available to all in the health care industry.</p>

<p> This API, for the moment, only has data for the city of San Francisco in a 10-mile radius and only has information for the 4 biggest insurance providers that participate in Covered California (California's Department for the Affordable Care Act). The companies are Anthem Blue Cross, Blue Shield, Kaiser and Chinese Community Health Plan(CCHP). This API is searchable, in addition to the insurance policies, by doctor name, doctor specialty and doctor medical group.</p>

<p>If you appreciate this work or would like help get a robust public health API started, please feel free to email me at <br><a>joshua.david.pearson@gmail.com</a><br> or connect via my linkedIn at<br><a>www.linkedin.com/in/joshuapears0n</a></p>
