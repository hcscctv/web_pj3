<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload</title>
    <link rel="stylesheet" href="src/css/common.css">
    <link rel="stylesheet" href="src/css/nav.css">
    <link rel="stylesheet" href="src/css/Upload.css">
</head>

<body>
<nav>
    <script src="src/js/part.js"></script>
    <ul id="nav" name="nav">
        <li id="logo">
            <a href="./HomePage.jsp"><img src="img/logo_nav.png"></a>
        </li>
        <li class="this"><a href="./HomePage.jsp">Home</a></li>
        <li><a href="Search.jsp">Search</a></li>
        <li id="account">
            <% session.setAttribute("recent_url", request.getRequestURL());
                if (session.getAttribute("user") == null) {
                    response.sendRedirect("login.jsp");
                    return;
                } else {%>
            My&nbsp; Account&nbsp;<br>
            <ul id="dropdown">
                <li>
                    <a href="Upload.jsp"><img src="img/upload.png" alt="">Upload</a>
                </li>
                <li>
                    <a href="my_photo.jsp"><img src="img/photo.png" alt="">My photo</a>
                </li>
                <li>
                    <a href="favor.jsp"><img src="img/favourite.png" alt="">My favorite</a>
                </li>
                <li>
                    <a href="login.jsp"><img src="img/login.png" alt="">Log out</a>
                </li>
                <li>
                    <a href="friend.jsp"><img src="img/friend.png" alt="">Friend</a>
                </li>
            </ul>
            <%}%>
        </li>
    </ul>
</nav>
    <div id="main">
        <form action="UploadServlet" method="post" enctype="multipart/form-data" id="form" onsubmit="return check_submit()">
            <div id="title">Upload</div>
            <div>
                <img id="img0">
                <span class="fileinput-button">
                <!-- 显示的按钮 -->
        <button id="button">上传(暂未上传）</button>
                    <!-- 上传的图片 -->
        <input type="file" name="file" id="file"  accept="image/*" required>
        <script src="src/js/upload.js">
        </script>
        </span>
            </div>
            <br><br><br><br><br><br>

            <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
            <label>图片标题：</label>
            <input type="text" class="detail_input" name="title" required>
            <br> <label>图片描述：</label>
            <textarea name="detail" id="detail" cols="30" rows="3" class="detail_input" required></textarea>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#160;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select name="content" id="content" required>
                <option value="scenery" selected>Scenery</option>
                <option value="city">City</option>
                <option value="people">People</option>
                <option value="animal">Animal</option>
                <option value="building">Building</option>
                <option value="wonder"> Wonder</option>
            </select>
            <select class="area-select" id="country" name="country">
                    <option value="0">请选择国家</option>
                    <option value="Andorra">Andorra</option><option value="United Arab Emirates">United Arab Emirates</option><option value="Afghanistan">Afghanistan</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Anguilla">Anguilla</option><option value="Albania">Albania</option><option value="Armenia">Armenia</option><option value="Netherlands Antilles">Netherlands Antilles</option><option value="Angola">Angola</option><option value="Antarctica">Antarctica</option><option value="Argentina">Argentina</option><option value="American Samoa">American Samoa</option><option value="Austria">Austria</option><option value="Australia">Australia</option><option value="Aruba">Aruba</option><option value="Aland Islands">Aland Islands</option><option value="Azerbaijan">Azerbaijan</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Barbados">Barbados</option><option value="Bangladesh">Bangladesh</option><option value="Belgium">Belgium</option><option value="Burkina Faso">Burkina Faso</option><option value="Bulgaria">Bulgaria</option><option value="Bahrain">Bahrain</option><option value="Burundi">Burundi</option><option value="Benin">Benin</option><option value="Saint Barthelemy">Saint Barthelemy</option><option value="Bermuda">Bermuda</option><option value="Brunei">Brunei</option><option value="Bolivia">Bolivia</option><option value="Bonaire, Saint Eustatius and Saba">Bonaire, Saint Eustatius and Saba</option><option value="Brazil">Brazil</option><option value="Bahamas">Bahamas</option><option value="Bhutan">Bhutan</option><option value="Bouvet Island">Bouvet Island</option><option value="Botswana">Botswana</option><option value="Belarus">Belarus</option><option value="Belize">Belize</option><option value="Canada">Canada</option><option value="Cocos Islands">Cocos Islands</option><option value="Democratic Republic of the Congo">Democratic Republic of the Congo</option><option value="Central African Republic">Central African Republic</option><option value="Republic of the Congo">Republic of the Congo</option><option value="Switzerland">Switzerland</option><option value="Ivory Coast">Ivory Coast</option><option value="Cook Islands">Cook Islands</option><option value="Chile">Chile</option><option value="Cameroon">Cameroon</option><option value="China">China</option><option value="Colombia">Colombia</option><option value="Costa Rica">Costa Rica</option><option value="Serbia and Montenegro">Serbia and Montenegro</option><option value="Cuba">Cuba</option><option value="Cape Verde">Cape Verde</option><option value="Curacao">Curacao</option><option value="Christmas Island">Christmas Island</option><option value="Cyprus">Cyprus</option><option value="Czech Republic">Czech Republic</option><option value="Germany">Germany</option><option value="Djibouti">Djibouti</option><option value="Denmark">Denmark</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="Algeria">Algeria</option><option value="Ecuador">Ecuador</option><option value="Estonia">Estonia</option><option value="Egypt">Egypt</option><option value="Western Sahara">Western Sahara</option><option value="Eritrea">Eritrea</option><option value="Spain">Spain</option><option value="Ethiopia">Ethiopia</option><option value="Finland">Finland</option><option value="Fiji">Fiji</option><option value="Falkland Islands">Falkland Islands</option><option value="Micronesia">Micronesia</option><option value="Faroe Islands">Faroe Islands</option><option value="France">France</option><option value="Gabon">Gabon</option><option value="United Kingdom">United Kingdom</option><option value="Grenada">Grenada</option><option value="Georgia">Georgia</option><option value="French Guiana">French Guiana</option><option value="Guernsey">Guernsey</option><option value="Ghana">Ghana</option><option value="Gibraltar">Gibraltar</option><option value="Greenland">Greenland</option><option value="Gambia">Gambia</option><option value="Guinea">Guinea</option><option value="Guadeloupe">Guadeloupe</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Greece">Greece</option><option value="South Georgia and the South Sandwich Islands">South Georgia and the South Sandwich Islands</option><option value="Guatemala">Guatemala</option><option value="Guam">Guam</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Hong Kong">Hong Kong</option><option value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option><option value="Honduras">Honduras</option><option value="Croatia">Croatia</option><option value="Haiti">Haiti</option><option value="Hungary">Hungary</option><option value="Indonesia">Indonesia</option><option value="Ireland">Ireland</option><option value="Israel">Israel</option><option value="Isle of Man">Isle of Man</option><option value="India">India</option><option value="British Indian Ocean Territory">British Indian Ocean Territory</option><option value="Iraq">Iraq</option><option value="Iran">Iran</option><option value="Iceland">Iceland</option><option value="Italy">Italy</option><option value="Jersey">Jersey</option><option value="Jamaica">Jamaica</option><option value="Jordan">Jordan</option><option value="Japan">Japan</option><option value="Kenya">Kenya</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Cambodia">Cambodia</option><option value="Kiribati">Kiribati</option><option value="Comoros">Comoros</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="North Korea">North Korea</option><option value="South Korea">South Korea</option><option value="Kuwait">Kuwait</option><option value="Cayman Islands">Cayman Islands</option><option value="Kazakhstan">Kazakhstan</option><option value="Laos">Laos</option><option value="Lebanon">Lebanon</option><option value="Saint Lucia">Saint Lucia</option><option value="Liechtenstein">Liechtenstein</option><option value="Sri Lanka">Sri Lanka</option><option value="Liberia">Liberia</option><option value="Lesotho">Lesotho</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Latvia">Latvia</option><option value="Libya">Libya</option><option value="Morocco">Morocco</option><option value="Monaco">Monaco</option><option value="Moldova">Moldova</option><option value="Montenegro">Montenegro</option><option value="Saint Martin">Saint Martin</option><option value="Madagascar">Madagascar</option><option value="Marshall Islands">Marshall Islands</option><option value="Macedonia">Macedonia</option><option value="Mali">Mali</option><option value="Myanmar">Myanmar</option><option value="Mongolia">Mongolia</option><option value="Macao">Macao</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Martinique">Martinique</option><option value="Mauritania">Mauritania</option><option value="Montserrat">Montserrat</option><option value="Malta">Malta</option><option value="Mauritius">Mauritius</option><option value="Maldives">Maldives</option><option value="Malawi">Malawi</option><option value="Mexico">Mexico</option><option value="Malaysia">Malaysia</option><option value="Mozambique">Mozambique</option><option value="Namibia">Namibia</option><option value="New Caledonia">New Caledonia</option><option value="Niger">Niger</option><option value="Norfolk Island">Norfolk Island</option><option value="Nigeria">Nigeria</option><option value="Nicaragua">Nicaragua</option><option value="Netherlands">Netherlands</option><option value="Norway">Norway</option><option value="Nepal">Nepal</option><option value="Nauru">Nauru</option><option value="Niue">Niue</option><option value="New Zealand">New Zealand</option><option value="Oman">Oman</option><option value="Panama">Panama</option><option value="Peru">Peru</option><option value="French Polynesia">French Polynesia</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Philippines">Philippines</option><option value="Pakistan">Pakistan</option><option value="Poland">Poland</option><option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option><option value="Pitcairn">Pitcairn</option><option value="Puerto Rico">Puerto Rico</option><option value="Palestinian Territory">Palestinian Territory</option><option value="Portugal">Portugal</option><option value="Palau">Palau</option><option value="Paraguay">Paraguay</option><option value="Qatar">Qatar</option><option value="Reunion">Reunion</option><option value="Romania">Romania</option><option value="Serbia">Serbia</option><option value="Russia">Russia</option><option value="Rwanda">Rwanda</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Solomon Islands">Solomon Islands</option><option value="Seychelles">Seychelles</option><option value="Sudan">Sudan</option><option value="Sweden">Sweden</option><option value="Singapore">Singapore</option><option value="Saint Helena">Saint Helena</option><option value="Slovenia">Slovenia</option><option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option><option value="Slovakia">Slovakia</option><option value="Sierra Leone">Sierra Leone</option><option value="San Marino">San Marino</option><option value="Senegal">Senegal</option><option value="Somalia">Somalia</option><option value="Suriname">Suriname</option><option value="South Sudan">South Sudan</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="El Salvador">El Salvador</option><option value="Sint Maarten">Sint Maarten</option><option value="Syria">Syria</option><option value="Swaziland">Swaziland</option><option value="Turks and Caicos Islands">Turks and Caicos Islands</option><option value="Chad">Chad</option><option value="French Southern Territories">French Southern Territories</option><option value="Togo">Togo</option><option value="Thailand">Thailand</option><option value="Tajikistan">Tajikistan</option><option value="Tokelau">Tokelau</option><option value="East Timor">East Timor</option><option value="Turkmenistan">Turkmenistan</option><option value="Tunisia">Tunisia</option><option value="Tonga">Tonga</option><option value="Turkey">Turkey</option><option value="Trinidad and Tobago">Trinidad and Tobago</option><option value="Tuvalu">Tuvalu</option><option value="Taiwan">Taiwan</option><option value="Tanzania">Tanzania</option><option value="Ukraine">Ukraine</option><option value="Uganda">Uganda</option><option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option><option value="United States">United States</option><option value="Uruguay">Uruguay</option><option value="Uzbekistan">Uzbekistan</option><option value="Vatican">Vatican</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Venezuela">Venezuela</option><option value="British Virgin Islands">British Virgin Islands</option><option value="U.S. Virgin Islands">U.S. Virgin Islands</option><option value="Vietnam">Vietnam</option><option value="Vanuatu">Vanuatu</option><option value="Wallis and Futuna">Wallis and Futuna</option><option value="Samoa">Samoa</option><option value="Kosovo">Kosovo</option><option value="Yemen">Yemen</option><option value="Mayotte">Mayotte</option><option value="South Africa">South Africa</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option>        </select>
            <select class="area-select" id="city" name="city">
                <option value="0">请选择城市</option>
            </select>

            <br>

            <button type="submit" name="submit" onclick="check_submit()">submit</button>
            <script>function check_submit() {
                if (($('#country').val() != 0) && ($('#city').val() != 0)) {
                    let r = confirm("are you sure what you fill")
                    return r;
                } else {
                    if ($('#country').val() == 0) {
                        $('#country').css("color", "red");
                    }
                    if ($('#city').val() == 0) $('#city').css("color", "red");
                    return false;
                }
            }</script>
        </form>
    </div>
    <script>
        $(function () {
            var url = 'src/js/cities.json';
            $("#country").change(function () {
                var address = $(this).val();
                $.ajax({
                    type: 'post',
                    url: url,
                    dataType: 'json',
                    success: function (data) {
                        console.log(data)
                        let ans = data[address];
                        var option = '';
                        if (ans == null) option = '\'<option>\' + address + \'</option>\''
                        else for (var i = 0; i < ans.length; i++) {
                            option += '<option value=' + ans[i] + '>' + ans[i] + '</option>';
                        }
                        $("#city").html(option);
                    },
                });
            });
        });
    </script>
    <footer>
        Copyright&#169;19302010004 黄呈松
    </footer>
</body>

</html>