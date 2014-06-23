
browser = Watir::Browser.start "https://www.blueshieldca.com/fap/app/search.html"
browser.link(:text, "select").click
browser.select_list(:id, "medical").when_present.select("2014 Individual and Family PPO Plans (including Covered California)")
browser.select_list(:id, "medSubPaln").when_present.select("Basic PPO for HSA (Bronze level)")
browser.button(:value,"setplan").click
browser.text_field(:id, "location").set("94110")
browser.button(:value,"findNow").click
until browser.select_list(:id, "radiusid").exists?
  sleep 1
end
browser.select_list(:id, "radiusid").select("10 mi.")

y = 1
x = 12
until y == 5000
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

  Doctor.create!(name: name, specialty: specialty, phone: phone, medical_group: medical_group, address: address, city: city, zip_code: zip_code, insurance_plan: "blue_shield_bronze_60_PPO")
  if y % 10 == 0
    x += 2
    browser.div(:id, "nextpage").click
    y += 1
  else
    x += 1
    y += 1
  end
end

# browser = Watir::Browser.start "https://www.anthem.com/health-insurance/provider-directory/searchcriteria?qs=*5MFKC18jLwG2/gYGCqVozg==&brand=abc"
#   until
#     browser.select_list(:id, "ctl00_MainContent_maincontent_SearchWizard6_SearchWizard5_ZipCityStateRadius").exists?
#     sleep 1
#   end
# browser.select_list(:id, "ctl00_MainContent_maincontent_SearchWizard6_SearchWizard5_ZipCityStateRadius").when_present.select("10")
# browser.text_field(:id, "ctl00_MainContent_maincontent_SearchWizard6_SearchWizard5_txtZipCityState").set("94110")
# browser.select_list(:id, "ctl00_MainContent_maincontent_SearchWizard7_ddlplanstate").select("California")
# browser.select_list(:id, "ctl00_MainContent_maincontent_SearchWizard7_ddlplans").select("Pathway X - PPO / Individual via Exchange")
# browser.select_list(:id, "ctl00_MainContent_maincontent_SearchWizard7_ddlplan").select("Bronze DirectAccess")
# browser.button(:id, "btnSearch").click

# y = 1
# x = 1
# until y == 100
#   if x % 60 == 0 || y % 60 == 0
#     x = 1
#   end
#   if browser.a(:class, "fsrCloseBtn").exists?
#     browser.a(:class, "fsrCloseBtn").click
#   end
#   if y % 20 == 0 || x % 20 == 0
#     browser.a(:id, "tablePagination_nextPage").click
#   end
#   until
#     browser.a(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lnkName").exists?
#     sleep 1
#   end
#   if browser.a(:class, "fsrCloseBtn").exists?
#     browser.a(:class, "fsrCloseBtn").click
#   end

#   processed_name = browser.a(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lnkName").text
#   if processed_name
#     name = processed_name.split(" ")[1].capitalize + ", " + processed_name.split(" ")[0].capitalize + " MD"
#   end
#   specialty = browser.span(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_specialtyList_ctrl0_lblSpecialty").text.split(",").join
#   phone = browser.span(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lblPhoneNumber").text
#   address = browser.span(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lblAddress").text.split(",").join
#   city = browser.span(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lblCity").text.split(",").join
#   zip_code = browser.span(:id, "ctl00_ResultsList_ctrl" + x.to_s + "_lblZipCode").text

#   Doctor.create!(name: name, specialty: specialty, phone: phone, address: address, city: city, zip_code: zip_code, insurance_plan: "blue_cross_bronze_60_PPO")
  
#   y += 1
#   x += 1
# end
# doctors_chinese_community = JSON.parse(File.read(chinese_community_health))

# doctors_blue_cross = JSON.parse(File.read(anthem_blue_cross))

# doctors_kaiser = JSON.parse(File.read(kaiser))

# doctors_blue_shield = JSON.parse(File.read(blue_shield))

# doctors_chinese_community["data"].each do |doctor|
#   last_name = doctor["name"].join("").split(",")[0].strip.titleize
#   first_name = doctor["name"].join("").split(",")[1].strip.titleize
#   address = doctor["address"].join
#   Doctor.create!(address: address, first_name: first_name, last_name: last_name, insurance_plan: "cchp_bronze_60_HMO")
# end

# doctors_blue_cross["data"].each do |doctor|
#   last_name = doctor["name"].join("").split(",")[0].strip.titleize
#   first_name = doctor["name"].join("").split(",")[1].strip.titleize
#   address = doctor["address"].join
#   Doctor.create!(address: address, first_name: first_name, last_name: last_name, insurance_plan: "blue_cross_bronze_60_PPO")
# end

# doctors_kaiser["data"].each do |doctor|
#   last_name = doctor["name"].join("").split(",")[0].strip.titleize
#   first_name = doctor["name"].join("").split(",")[1].strip.titleize
#   address = doctor["address"].join
#   Doctor.create!(address: address, first_name: first_name, last_name: last_name, insurance_plan: "kaiser_bronze_HMO_4500_40")
# end

# doctors_blue_shield["data"].each do |doctor|
#   last_name = doctor["name"].join("").split(",")[0].strip.titleize
#   first_name = doctor["name"].join("").split(",")[1].strip.titleize
#   address = doctor["address"].join
#   Doctor.create!(address: address, first_name: first_name, last_name: last_name, insurance_plan: "blue_shield_bronze_60_PPO")
# end