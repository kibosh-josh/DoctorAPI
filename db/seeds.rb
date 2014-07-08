browser = Watir::Browser.start "https://www.blueshieldsite.com"
browser.link(:text, "select").click
browser.select_list(:id, "whoops").when_present.select("2014 Individual and Family EPO Plans (including Covered California)")
browser.select_list(:id, "dontgothere").when_present.select("Basic EPO (Bronze level)")
browser.button(:value,"noway").click
browser.text_field(:id, "location").set("94110")
browser.button(:value,"findNow").click
until browser.select_list(:id, "radiusid").exists?
  sleep 1
end
browser.select_list(:id, "radiusid").select("10 mi.")

y = 1
x = 12
until y == 920
  until
    browser.div(:id, "fap_" + x.to_s).exists?
    sleep 1
  end
  name = browser.div(:id, "fap_" + x.to_s).a.text
  specialty = browser.div(:id, "fap_" + x.to_s).a(:class, "docSpecialization").text
  phone = browser.div(:id, "fap_" + x.to_s).strong(:class, "docPhoneNumber").text
  medical_group = browser.div(:id, "fap_" + x.to_s).div(:class, 'docMedicalGroupsAccepting').text.split("-")[0]
  address = browser.div(:id, "fap_" + x.to_s).span(:class, "docAddress").text.split("\n")[0].to_s
  city = browser.div(:id, "fap_" + x.to_s).span(:class, "docAddress").text.split("\n")[1].split(", ")[0].to_s
  zip_code = browser.div(:id, "fap_" + x.to_s).span(:class, "docAddress").text.split("\n")[1].split(", ")[1].split(" ")[1]

  Doctor.find_or_create_by(name: name, specialty: specialty, phone: phone, medical_group: medical_group, address: address, city: city, zip_code: zip_code, insurance_plan: "blue_shield_EPO")
  if y % 10 == 0
    x += 2
    browser.div(:id, "nextpage").click
    y += 1
  else
    x += 1
    y += 1
  end
end



browser = Watir::Browser.start "https://www.bluecrosswebsite.com"
sleep 5
browser.select_list(:id, "aRidculousID").when_present.select("10")
browser.text_field(:id, "stupidID").set("94110")
browser.select_list(:id, "ctl00_MainContent_maincontent_SearchWizard7_ddlplanstate").select("California")
browser.select_list(:id, "ctl00_MainContent_maincontent_SearchWizard7_ddlplans").select("Pathway X - PPO / Individual via Exchange")
browser.select_list(:id, "ctl00_MainContent_maincontent_SearchWizard7_ddlplan").select("Bronze DirectAccess")
browser.button(:id, "btnSearch").click

y = 1
x = 0
until y == 3000
  if y % 60 == 0
    x = 0
  end
  if browser.a(:class, "fsrCloseBtn").exists?
    browser.a(:class, "fsrCloseBtn").click
  end
  if y % 20 == 0
    browser.a(:id, "tablePagination_nextPage").click
    sleep 5
  end
  until
    browser.a(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lnkName").exists?
    sleep 1
  end
  if browser.a(:class, "fsrCloseBtn").exists?
    browser.a(:class, "fsrCloseBtn").click
  end

  if 
    browser.a(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lnkName").exists? == true
    processed_name = browser.a(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lnkName").text
  end
  if processed_name != ""
    name = processed_name.split(" ")[1].capitalize + ", " + processed_name.split(" ")[0].capitalize + " MD"
  else
    name = ""
  end
  specialty = browser.span(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_specialtyList_ctrl0_lblSpecialty").text.split(",").join
  phone = browser.span(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lblPhoneNumber").text
  address = browser.span(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lblAddress").text.split(",").join
  city = browser.span(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lblCity").text.split(",").join
  zip_code = browser.span(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lblZipCode").text

  Doctor.find_or_create_by(name: name, specialty: specialty, phone: phone, address: address, city: city, zip_code: zip_code, insurance_plan: "blue_cross_EPO")
  y += 1
  x += 1
end

browser = Watir::Browser.start "http://www.Kaiserwebsite.com"
browser.link(:id, "cydGoToSearch").when_present.click
browser.radio({:id => "speciality", :value => "PED"}).when_present.set
browser.text_field(:id, "zipcode").when_present.set("94110")
browser.select_list(:id, "distance").select("15 miles")
browser.link(:id, "cydSearchBtn").click
sleep 3

x = 0
y = 1
until y == 78
  
  if y % 10 == 0
    browser.link(:text, "Next »").click
    x = 0
    sleep 5
  end

  processed_name = browser.div(:id, "CYDSearchContent").div({:class => "doctorInfo fLeft bt1 pb30", :index => x}).h3(:class, "title pb0i pl10 mb10 fLeft").text.split(" ")
  name = processed_name[1] + " " + processed_name[0] + " " + processed_name[2]
  phone = nil
  medical_group = browser.div(:id, "CYDSearchContent").div({:class => "doctorInfo fLeft bt1 pb30", :index => x}).table.tbody.tr.div(:class, "bold").text
  address = browser.div(:id, "CYDSearchContent").div({:class => "doctorInfo fLeft bt1 pb30", :index => x}).table.tbody.tr.div(:class, "mt5").text.split("\n")[1].strip
  city = browser.div(:id, "CYDSearchContent").div({:class => "doctorInfo fLeft bt1 pb30", :index => x}).table.tbody.tr.div(:class, "mt5").text.split("\n")[2].split(",")[0].strip
  zip_code = browser.div(:id, "CYDSearchContent").div({:class => "doctorInfo fLeft bt1 pb30", :index => x}).table.tbody.tr.div(:class, "mt5").text.split("\n")[2].split(",")[1].split(" ")[1]


  Doctor.find_or_create_by(name: name, specialty: "Pediatrics", medical_group: medical_group, address: address, city: city, zip_code: zip_code, insurance_plan: "kaiser_HMO")

  x += 1
  y += 1
end