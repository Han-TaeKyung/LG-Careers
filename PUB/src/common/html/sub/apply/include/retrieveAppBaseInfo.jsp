<%-- /*------------------------------------------------------------------------------ * PROJ : LG Group Recruit Portal
Prj. * NAME : registAppBaseInfo.jsp * DESC : 입사지원서 작성 - 기본인적사항/상세인적사항/경력사항/자기소개서/제출확인 * Author : Publisher *
Copyright 2013 LG Group, All rights reserved.
*------------------------------------------------------------------------------ * Change Logs
*------------------------------------------------------------------------------ * 1.0. YoungRan : 2013. 9. 30.
Initial Created. 현장직추가 2018.05.08 * 1.1. wssim : 2019. 8. 22. 동의서 추가 ((agree190822))_
*------------------------------------------------------------------------------*/ --%>
<%@ page language="java" pageEncoding="utf-8" %>
<!-- FPT - Static Analysis Handle - EDIT START -->
<!DOCTYPE html>
<!-- FPT - Static Analysis Handle - EDIT END -->
<html lang="ko">

<head>
<%@ include file="/WEB-INF/jsp/com/include/head.jspf" %>
<title>
  <LTag:message code="app.titl.applyInfo" />
</title>

<style type="text/css">
  div.sameOpenRecruitApplicationList {
      margin-top: 0.5em;
  }
</style>

<script type="text/javascript">
  var careerType = '<c:out value="${jobNoticeInfo.careerTypeCode}"/>';
  var jobNoticeId = '<c:out value="${jobNoticeInfo.jobNoticeId}"/>';
  var recruitTypeCode = '<c:out value="${jobNoticeInfo.recruitTypeCode}"/>';
  var prevExperCount = '<c:out value="${prevExperCount}"/>';
  var militaryInputFlag = '<c:out value="${jobNoticeInfo.militaryInputFlag}"/>';
  var lowIncomeInputFlag = '<c:out value="${jobNoticeInfo.lowIncomeInputFlag}"/>';
  var languageInputFlag = '<c:out value="${jobNoticeInfo.languageInputFlag}"/>';
  var globalInputFlag = '<c:out value="${jobNoticeInfo.globalInputFlag}"/>';
  var schoolInputFlag = '<c:out value="${jobNoticeInfo.schoolInputFlag}"/>';
  var engineeringAccrFlag = '<c:out value="${jobNoticeInfo.engineeringAccrFlag}"/>';
  var highschoolFlag = '<c:out value="${jobNoticeInfo.highschoolFlag}"/>';
  var addSchoolFlag = '<c:out value="${jobNoticeInfo.addSchoolFlag}"/>';
  var addTextFlag = '<c:out value="${jobNoticeInfo.addTextFlag}"/>';
  var addTextType = '<c:out value="${jobNoticeInfo.addTextType}"/>';
  var lgatFlag = '<c:out value="${jobNoticeInfo.lgatFlag}"/>';
  var addressYN = '<c:out value="${jobNoticeInfo.addressFlag}"/>';
  var jobStartDate = '<c:out value="${jobNoticeInfo.recStartDate}"/>';
  var applyCustomSubmitGuideCode = '<c:out value="${jobNoticeInfo.applyCustomSubmitGuideCode}"/>';

  var qualificationInputFlag = '<c:out value="${jobNoticeInfo.qualificationInputFlag}"/>';
  var etcInputFlag = '<c:out value="${jobNoticeInfo.etcInputFlag}"/>';
  var passFlag = '<c:out value="${jobNoticeInfo.passOption}"/>';
  var collegeInfoCount = '<c:out value="${collegeInfoCount}"/>';
  var uniCount = '<c:out value="${uniCount}"/>';
  var masterCount = '<c:out value="${masterCount}"/>';
  var doctorCount = '<c:out value="${doctorCount}"/>';
  var globalCount = '<c:out value="${globalCount}"/>';
  var qualifiCount = '<c:out value="${qualifiCount}"/>';
  var alreadyApply = '<c:out value="${alreadyApply}"/>';
  var alreadyOtherApply = '<c:out value="${alreadyOtherApply}"/>';
  var orderOfDesireCount = '<c:out value="${orderOfDesireCount}"/>';

  var tabIdx = '<c:out value="${param.tabIdx}"/>';
  var recAvail = '<c:out value="${jobNoticeInfo.recAvail}"/>';
  var resumeStatus = '<c:out value="${baseInfo.resumeStatus}"/>';
  var appTabIdx = '<c:out value="${data.appTabIdx}"/>';


  var elemschInputFlag = '<c:out value="${jobNoticeInfo.elemschInputFlag}"/>';
  //화확현장직추가
  var highschRankInputFlag = '<c:out value="${jobNoticeInfo.highschRankInputFlag}"/>';
  var highschAttendInputFlag = '<c:out value="${jobNoticeInfo.highschAttendInputFlag}"/>';
  var middleschInputFlag = '<c:out value="${jobNoticeInfo.middleschInputFlag}"/>';
  var highschRankCourse = '<c:out value="${jobNoticeInfo.highschRankCourse}"/>';
  //동의서추가
  var reputeAgreeYn = '<c:out value="${jobNoticeInfo.reputeAgreeYn}"/>';
  var saleSecViolAgreeYn = '<c:out value="${jobNoticeInfo.saleSecViolAgreeYn}"/>';
  var agreeCnt = 0; if (reputeAgreeYn == "N") agreeCnt++; if (saleSecViolAgreeYn == "N") agreeCnt++;

  var schoolInputSelected = ${ empty jobNoticeInfo.schoolInputSelected ?'[]': jobNoticeInfo.schoolInputSelected };
  var sameOpenRecruitApplicationList = []; // 제출시 같은 공채의 지원정보 표시하지 않음.


  var flaCodeList;
  var flaLevelList;
  var languageTestList;

  var desireLocCodeList = ${ empty jsonDesireLocCodeList ?'null': jsonDesireLocCodeList };
  var desireJobCodeList = ${ empty jsonDesireJobCodeList ?'null': jsonDesireJobCodeList };

  if (languageInputFlag == 'N') {
      flaCodeList = ${empty jsonFlaCodeList ? 'null' : jsonFlaCodeList };
      if (passFlag != 'Y') {
          flaLevelList = ${empty jsonFlaLevelList ? 'null' : jsonFlaLevelList };
      }

      languageTestList = ${empty jsonLanguageTestList ? 'null' : jsonLanguageTestList };
  }

</script>

<script type="text/javascript" src="${cdnJsPath}/app/appl/aplc/retrieveAppBaseInfo.js"></script>
<script type="text/javascript" src="${cdnJsPath}/app/appl/aplc/retrieveDupApply.js"></script>
<script type="text/javascript" src="${cdnJsPath}/com/popup/searchPopup.js"></script>
<script type="text/javascript" src="${cdnJsPath}/app/appl/aplc/checkApplyDialog.js"></script>
<script type="text/javascript" src="${cdnJsPath}/app/appl/aplc/submitConfirmDialog.js"></script>
<script type="text/javascript" src="${cdnJqueryPath}/jquery.placeholder.js"></script>
<script type="text/javascript" src="${cdnJqueryPath}/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="${cdnJsPath}/ff_bugfix.js"></script>


</head>

<body>
<%@ include file="/WEB-INF/jsp/com/include/skipnavigation.jspf" %>
<div class="LblockWrapper">
  <%@ include file="/WEB-INF/jsp/com/include/top.jspf" %>

      <div class="LblockContentGroup">
          <div id="LblockContent" class="LblockContent">
              <div id="LblockPageHeader" class="LblockPageHeader">
                  <div class="LblockPageTitle applicationform">
                      <h1>
                          <LTag:message code="app.titl.applyInfo" />
                      </h1>
                      <span>
                          <LTag:message code="app.titl.applyTopTitle" />
                      </span>
                  </div>
                  <div class="LblockPageLocation">
                      <ul>
                          <li class="Lfirst"><span>Apply</span></li>
                          <li><span>나의 채용</span></li>
                          <li><span>지원서작성</span></li>
                          <li class="Llast">기본인적사항</li>
                      </ul>
                  </div>
              </div>
              <div class="LblockContentMain">
                  <c:if
                      test="${jobNoticeInfo.recruitTypeCode != 'D' && jobNoticeInfo.recruitTypeCode != 'H'}">
                      <div class="LblockTab indicate">
                          <ul>
                              <li class="Lfirst Lcurrent"><a href="#LblockTabContent01"
                                      onclick="$.submitFlag();">
                                      <LTag:message code="app.tab.baseInfo" />
                                  </a></li>
                              <li><a href="#LblockTabContent02" onclick="$.submitFlag();">
                                      <LTag:message code="app.tab.detailInfo" />
                                  </a></li>
                              <c:if
                                  test="${jobNoticeInfo.careerTypeCode != 'A' && jobNoticeInfo.careerTypeCode != 'C'}">
                                  <li><a href="#LblockTabContent03" onclick="$.submitFlag();">
                                          <LTag:message code="app.tab.prevExpInfo" />
                                      </a></li>
                              </c:if>
                              <li><a href="#LblockTabContent04" onclick="$.submitFlag();">
                                      <c:choose>
                                          <c:when
                                              test="${jobNoticeInfo.careerTypeCode == 'A' || jobNoticeInfo.careerTypeCode == 'C'}">
                                              <LTag:message code="app.tab.applicationTr" />
                                          </c:when>
                                          <c:otherwise>
                                              <LTag:message code="app.tab.application" />
                                          </c:otherwise>
                                      </c:choose>
                                  </a></li>
                              <li class="Llast"><a href="#LblockTabContent05"
                                      onclick="$.fViewAppCompleteDoc();">
                                      <c:choose>
                                          <c:when
                                              test="${jobNoticeInfo.careerTypeCode == 'A' || jobNoticeInfo.careerTypeCode == 'C'}">
                                              <LTag:message code="app.tab.confSubmitTr" />
                                          </c:when>
                                          <c:otherwise>
                                              <LTag:message code="app.tab.confSubmit" />
                                          </c:otherwise>
                                      </c:choose>
                                  </a></li>
                          </ul>
                      </div>
                      <div class="Lexplanation">
                          <p><strong>
                                  <LTag:message code="app.cont.saveCont" />
                              </strong></p>
                      </div>

                  </c:if>
                  <c:if
                      test="${jobNoticeInfo.recruitTypeCode != 'D' && jobNoticeInfo.recruitTypeCode != 'H'}">
                      <form id="submitForm" name="submitForm" method="post">
                          <rec:savedToken name="applySumbit" />
                      </form>
                  </c:if>
                  <div id="LblockTabContent01" class="LblockTabContent">
                      <form id="baseInfoForm" name="baseInfoForm" method="post"
                          enctype="multipart/form-data">
                          <c:if
                              test="${jobNoticeInfo.recruitTypeCode != 'D' && jobNoticeInfo.recruitTypeCode != 'H'}">
                              <h2 class="Lhide">
                                  <LTag:message code="app.tab.baseInfo" />
                              </h2>
                              <div class="LviewExplanation">
                                  <p><strong>
                                          <LTag:message code="app.btn.applyWriteGuide" />
                                      </strong><a href="#" onclick="applcationGuidePopup();">
                                          <LTag:message code="app.cont.view" />
                                      </a></p>
                              </div>
                              <rec:savedToken name="sessionscopebase" scope="session" />
                          </c:if>
                          <c:if
                              test="${jobNoticeInfo.recruitTypeCode == 'D' || jobNoticeInfo.recruitTypeCode == 'H'}">
                              <rec:savedToken name="baseInfo" />
                          </c:if>
                          <c:if
                              test="${jobNoticeInfo.recruitTypeCode != 'D' && jobNoticeInfo.recruitTypeCode != 'H'}">
                              <c:if test="${!empty beforeJobNoticeId}">
                                  <div class="LblockPageLink">
                                      <p class="links" id="beforeBaseInfo">
                                          <LTag:message code="app.cont.topCont_1" /> <a
                                              href="javascript:;" onClick="retrieveBeforeApply();">
                                              <LTag:message code="app.cont.topCont_2" />
                                          </a>
                                      </p>
                                  </div>
                              </c:if>

                              <div class="foldedInphone">
                                  <div class="dtFoldedInPhone">
                                      <div class="LblockPageSubtitle">
                                          <h3>
                                              <LTag:message code="app.titl.appInfo" />
                                          </h3>
                                      </div>
                                  </div>
                                  <div class="ddFoldedInPhone">
                                      <div class="LblockDetailTable">
                                          <input type="hidden" id="orderOfDesireCount"
                                              name="orderOfDesireCount"
                                              value="<c:out value='${orderOfDesireCount}' />" />
                                          <table id="desireTable"
                                              class="applicationform desire rsp rsp-hori rsp-tablet">
                                              <caption>지원사항</caption>
                                              <tbody>
                                                  <tr<c:if
                                                      test="${jobNoticeInfo.subCompanyYn eq 'Y'}">
                                                      style="display:none;"
                          </c:if>>
                          <th scope="row" style="width:20%;"><label class="required"><span
                                      class="Lhide">(필수)</span>
                                  <LTag:message code="app.lbl.applyCompany" />
                              </label></th>
                          <td>
                              <c:out value='${jobNoticeInfo.companyName}' />
                          </td>
                          </tr>
                          <c:forEach items="${orderOfDesireList.code}" varStatus="i">
                              <tr>
                                  <th scope="row" style="width:20%;"><label <c:if
                                          test="${orderOfDesireList.code[i.index] == '1'}">class="required"
                                          </c:if> for="orgCode_${orderOfDesireList.code[i.index]}">
                                          <c:if test="${orderOfDesireList.code[i.index] == '1'}"><span
                                                  class="Lhide">(필수)</span></c:if>
                                          <c:out value='${orderOfDesireList.value[i.index]}' />
                                      </label></th>
                                  <td class="twoOrMoreSelects">
                                      <select id="orgCode_${orderOfDesireList.code[i.index]}"
                                          name="orgCode_${orderOfDesireList.code[i.index]}"
                                          onchange="onChangeOrgCode(this);"
                                          title="<c:out value='${orderOfDesireList.value[i.index]}' /> <LTag:message code="
                                          app.lbl.orgCode" />">
                                      <option value="">
                                          <c:choose>
                                              <c:when test="${jobNoticeInfo.subCompanyYn eq 'Y'}">지원회사
                                              </c:when>
                                              <c:otherwise>
                                                  <LTag:message code="app.lbl.orgCode" />
                                              </c:otherwise>
                                          </c:choose>
                                      </option>
                                      <c:forEach items="${desireOrgCodeList.orgCode}" varStatus="j">
                                          <option
                                              value="<c:out value='${desireOrgCodeList.orgCode[j.index]}'/>"
                                              <c:if
                                              test="${orderOfDesireList.code[i.index]==hopeWork.orderOfDesire[i.index] && hopeWork.orgCode[i.index]==desireOrgCodeList.orgCode[j.index]}">
                                              selected="selected" </c:if>>
                                              <c:out value='${desireOrgCodeList.orgName[j.index]}' />
                                          </option>
                                      </c:forEach>
                                      </select>
                                      <input type="hidden"
                                          id="recSectorId_${orderOfDesireList.code[i.index]}"
                                          name="recSectorId_${orderOfDesireList.code[i.index]}"
                                          value="<c:out value='${desireOrgCodeList.recSectorId[j.index]}' />" />
                                      <select id="jobCode_${orderOfDesireList.code[i.index]}"
                                          name="jobCode_${orderOfDesireList.code[i.index]}"
                                          onchange="onChangeJobCode(this);"
                                          title="<c:out value='${orderOfDesireList.value[i.index]}' /> <LTag:message code="
                                          app.lbl.jobCode" />">
                                      <option value="">
                                          <LTag:message code="app.lbl.jobCode" />
                                      </option>
                                      </select>
                                      <c:forEach items="${desireJobCodeList.jobCode}" varStatus="k">
                                          <c:if
                                              test="${orderOfDesireList.code[i.index]==hopeWork.orderOfDesire[i.index] && hopeWork.jobCode[i.index]==desireJobCodeList.jobCode[k.index]}">
                                              <c:if
                                                  test="${hopeWork.recSectorId[i.index]==desireJobCodeList.recSectorId[k.index]}">
                                                  <input type="hidden"
                                                      id="input_jobCode_${orderOfDesireList.code[i.index]}"
                                                      class="${desireJobCodeList.recSectorId[k.index]}"
                                                      value="<c:out value='${desireJobCodeList.jobCode[k.index]}' />" />
                                              </c:if>
                                          </c:if>
                                      </c:forEach>
                                      <select id="locationCode_${orderOfDesireList.code[i.index]}"
                                          name="locationCode_${orderOfDesireList.code[i.index]}"
                                          title="<c:out value='${orderOfDesireList.value[i.index]}' /> <LTag:message code="
                                          app.lbl.locationCode" />">
                                      <option value="">
                                          <LTag:message code="app.lbl.locationCode" />
                                      </option>
                                      </select>
                                      <c:forEach items="${desireLocCodeList.locationCode}"
                                          varStatus="l">
                                          <c:if
                                              test="${orderOfDesireList.code[i.index]==hopeWork.orderOfDesire[i.index] && hopeWork.locationCode[i.index]==desireLocCodeList.locationCode[l.index] && hopeWork.recSectorId[i.index]==desireLocCodeList.recSectorId[l.index]}">
                                              <input type="hidden"
                                                  id="input_locationCode_${orderOfDesireList.code[i.index]}"
                                                  value="<c:out value='${desireLocCodeList.locationCode[l.index]}'/>" />
                                          </c:if>
                                      </c:forEach>
                                  </td>
                              </tr>
                          </c:forEach>
                          <%-- <c:if test="${jobNoticeInfo.lgatFlag == 'Y'}">
                              <tr>
                                  <th class="crapInPhone" scope="row"><label class="required"
                                          for="fitLocCode"><span class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.fitLocCode" />
                                      </label></th>
                                  <td class="twoOrMoreSelects">
                                      <select id="fitLocCode" name="fitLocCode">
                                          <option value="">
                                              <LTag:message code="app.lbl.select" />
                                          </option>
                                          <c:choose>
                                              <c:when test="${not empty baseInfo.fitLocCode}">
                                                  지원서에 인적성검사 설정값이 있을 경우
                                                  <c:forEach items="${lgatAreaList.code}"
                                                      varStatus="l">
                                                      <option
                                                          value="<c:out value='${lgatAreaList.code[l.index]}'/>"
                                                          <c:if
                                                          test="${baseInfo.fitLocCode==lgatAreaList.code[l.index]}">
                                                          selected="selected" </c:if>>
                                                          <c:out
                                                              value='${lgatAreaList.value[l.index]}' />
                                                      </option>
                                                  </c:forEach>
                                              </c:when>
                                              <c:when
                                                  test="${jobNoticeInfo.careerTypeCode == 'A' && jobNoticeInfo.recruitTypeCode == 'A'}">
                                                  신입공채의 경우
                                                  <c:forEach items="${lgatAreaList.code}"
                                                      varStatus="l">
                                                      <option
                                                          value="<c:out value='${lgatAreaList.code[l.index]}'/>"
                                                          <c:if
                                                          test="${openRecruitLocInfo.fitLocCode==lgatAreaList.code[l.index]}">
                                                          selected="selected" </c:if>>
                                                          <c:out
                                                              value='${lgatAreaList.value[l.index]}' />
                                                      </option>
                                                  </c:forEach>
                                              </c:when>
                                              <c:otherwise>
                                                  지원서에 설정값도 없고 신입공채도 아닌경우
                                                  <c:forEach items="${lgatAreaList.code}"
                                                      varStatus="l">
                                                      <option
                                                          value="<c:out value='${lgatAreaList.code[l.index]}'/>">
                                                          <c:out
                                                              value='${lgatAreaList.value[l.index]}' />
                                                      </option>
                                                  </c:forEach>
                                              </c:otherwise>
                                          </c:choose>
                                      </select>
                                      <select id="fitLangCode" name="fitLangCode">
                                          <option value="">
                                              <LTag:message code="app.lbl.select" />
                                          </option>
                                          <c:forEach items="${lgatLangList.code}" varStatus="l">
                                              <option
                                                  value="<c:out value='${lgatLangList.code[l.index]}'/>"
                                                  <c:if
                                                  test="${baseInfo.fitLangCode==lgatLangList.code[l.index]}">
                                                  selected="selected" </c:if>>
                                                  <c:out value='${lgatLangList.value[l.index]}' />
                                              </option>
                                          </c:forEach>
                                      </select>
                                      <c:if
                                          test="${jobNoticeInfo.careerTypeCode == 'A' && jobNoticeInfo.recruitTypeCode == 'A'}">
                                          <div class="LinstructionWithinTable">인적성 검사 희망지역을 변경하면
                                              <c:choose>
                                                  <c:when test="${'FIRSTHALF' eq halfDate.halfDate}">
                                                      상반기</c:when>
                                                  <c:when test="${'SECONDHALF' eq halfDate.halfDate}">
                                                      하반기</c:when>
                                              </c:choose> 신입사원 공채에 지원한 모든 지원서의 인적성 지역이 동일하게 변경됩니다.
                                          </div>

                                          <div
                                              class="LinstructionWithinTable sameOpenRecruitApplicationList">
                                              <c:forEach
                                                  items="${sameOpenRecruitApplicationList.jobNoticeName}"
                                                  varStatus="l">
                                                  <div>
                                                      <span>[
                                                          <c:out
                                                              value='${sameOpenRecruitApplicationList.companyName[l.index]}' />
                                                          /
                                                          <c:out
                                                              value='${sameOpenRecruitApplicationList.resumeStatusName[l.index]}' />
                                                          ]
                                                      </span>
                                                      <span>
                                                          <c:out
                                                              value='${sameOpenRecruitApplicationList.jobNoticeName[l.index]}' />
                                                      </span>
                                                      <strong>[
                                                          <c:out
                                                              value='${sameOpenRecruitApplicationList.fitLocName[l.index]}' />
                                                          ]
                                                      </strong>
                                                  </div>
                                              </c:forEach>
                                          </div>

                                      </c:if>
                                  </td>
                              </tr>
                              </c:if> --%>
                              </tbody>
                              </table>
                  </div>
                  <div class="additionalTips">
                  </div>
              </div>
          </div>
          </c:if>

          <div class="foldedInphone">
              <div class="dtFoldedInPhone">
                  <div class="LblockPageSubtitle">
                      <h3>
                          <LTag:message code="app.titl.baseInfo" />
                      </h3>
                  </div>
              </div>
              <div class="ddFoldedInPhone">
                  <div class="LblockDetailTable">
                      <table class="applicationform rsp rsp-hori rsp-tablet">
                          <caption>
                              <LTag:message code="app.titl.baseInfo" />
                          </caption>
                          <tbody>
                              <tr>
                                  <th scope="row" style="width:20%;"><label>
                                          <LTag:message code="app.lbl.koreanName" />
                                      </label></th>
                                  <td id="koreanName">
                                      <c:out value="${applyMasterInfo.koreanName}" />
                                  </td>
                                  <th scope=row style="width:20%;"><label>
                                          <LTag:message code="app.lbl.englishName" />
                                      </label></th>
                                  <td id="englishName">
                                      <c:out value='${applyMasterInfo.englishName}' />
                                  </td>
                              </tr>
                              <tr>
                                  <th scope="row" style="width:20%;"><label>
                                          <LTag:message code="app.lbl.birthDate" />
                                      </label></th>
                                  <td id="birthDate">
                                      <c:out value="${applyMasterInfo.birthDate}" />
                                  </td>
                                  <th scope="row" style="width:20%;"><label class="required"><span
                                              class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.genderCode" />
                                      </label></th>
                                  <td><input type="radio" id="fGenderM" name="genderCode" value="M"
                                          <c:if test="${baseInfo.genderCode == 'M'}">
                                      checked="checked" </c:if> /><label for="fGenderM">
                                          <LTag:message code="app.lbl.male" />
                                      </label>
                                      <input type="radio" id="fGenderF" name="genderCode" value="F"
                                          <c:if test="${baseInfo.genderCode == 'F'}">
                                      checked="checked" </c:if> /><label for="fGenderF"
                                          id="gender_female">
                                          <LTag:message code="app.lbl.female" />
                                      </label>
                                      <span class="LinstructionWithinTable">병역 정보 확인을 위해 필요합니다.</span>
                                  </td>
                              </tr>
                              <tr>
                                  <th scope="row" style="width:20%;"><label class="required"
                                          for="nationalityName"><span class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.nationalityCode" />
                                      </label></th>
                                  <td>
                                      <div class="input_search">
                                          <input type="text" id="nationalityName"
                                              name="nationalityName" size="10"
                                              value="${!empty baseInfo.nationalityName == true ? baseInfo.nationalityName : '대한민국(한국)'}"
                                              readonly="readonly" />
                                          <input type="hidden" id="nationalityCode"
                                              name="nationalityCode"
                                              value="${!empty baseInfo.nationalityCode == true ? baseInfo.nationalityCode : 'KR'}" />
                                          <button type="button"
                                              onclick="dui.Calendar.close();searchCodePopup(this,'NA');">검색</button>
                                      </div>
                                  </td>
                                  <th scope="row" style="width:20%;"><label class="required"><span
                                              class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.email" />
                                      </label></th>
                                  <td id="email">
                                      <c:out value='${applyMasterInfo.email}' />
                                  </td>
                              </tr>
                              <tr id="visaTypeTr" <c:if
                                  test="${baseInfo.nationalityCode == null || baseInfo.nationalityCode == 'KR'}">
                                  style="display:none;"</c:if>>
                                  <th scope="row" style="width:20%;"><label>
                                          <LTag:message code="app.lbl.visaType" />
                                      </label></th>
                                  <td colspan="3">
                                      <select id="visaTypeCode" name="visaTypeCode">
                                          <option value="">
                                              <LTag:message code="app.lbl.select" />
                                          </option>
                                          <c:forEach items="${visaTypeList.code}" varStatus="l">
                                              <option
                                                  value="<c:out value='${visaTypeList.code[l.index]}'/>"
                                                  <c:if
                                                  test="${baseInfo.visaTypeCode==visaTypeList.code[l.index]}">
                                                  selected="selected" </c:if>>
                                                  <c:out value='${visaTypeList.value[l.index]}' />
                                              </option>
                                          </c:forEach>
                                      </select>
                                  </td>
                              </tr>
                              <tr>
                                  <th scope="row" style="width:20%;"><label class="required"><span
                                              class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.cellPhone" />
                                      </label></th>
                                  <td id="mobile">
                                      <c:out value='${applyMasterInfo.cellPhone}' />
                                  </td>
                                  <th scope="row" style="width:20%;"><label class="required"
                                          for="additionalContact"><span class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.additionalContact" />
                                      </label></th>
                                  <td>
                                      <span class="LinstructionWithinTable">
                                          <LTag:message code="myp.cont.accountCont_2" />
                                      </span>
                                      <input id="additionalContact" name="additionalContact"
                                          type="text" size="20"
                                          value="<c:out value='${applyMasterInfo.additionalContact}'/>"
                                          onKeyPress="return $.onKeyPressFilter('[0-9-]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9-]/g,'')"
                                          maxlength="30" />
                                  </td>
                              </tr>
                              <c:choose>
                                  <c:when
                                      test="${jobNoticeInfo.recruitTypeCode == 'D' || jobNoticeInfo.recruitTypeCode == 'H'}">
                                      <tr>
                                          <th scope="row" style="width:20%;"><label class="required"
                                                  for="addFile"><span class="Lhide">(필수)</span>
                                                  <LTag:message code="app.lbl.uploadApply" />
                                              </label></th>
                                          <td colspan="3">
                                              <div
                                                  class="set_selectInput hiddenInPhone hiddenInTablet">
                                                  <input type="hidden" id="deleteFileSeqNo"
                                                      name="deleteFileSeqNo" />
                                                  <input type="hidden" id="baseattachFileId"
                                                      name="baseattachFileId"
                                                      value="<c:out value='${baseInfo.attachFileId}'/>" />
                                                  <button type="button" class="btn_file"
                                                      onclick="addItem('#baseThesis','baseApply');"><span>
                                                          <LTag:message
                                                              code="app.lbl.addAttachFile" />
                                                      </span></button>
                                                  <span class="LinstructionWithinTable">
                                                      <LTag:message code="app.cont.attachFileLimit" />
                                                  </span>
                                                  <ul id="baseThesis" class="LblockItemList Lfile">
                                                      <c:forEach
                                                          items="${baseApplyFileList.attachFileId}"
                                                          varStatus="j">
                                                          <li style="">
                                                              <p><a href="javascript:;"
                                                                      onClick="fileDownload('${baseApplyFileList.dlFileName[j.index]}','${baseApplyFileList.attachFileId[j.index]}')">
                                                                      <c:out
                                                                          value='${baseApplyFileList.dlFileName[j.index]}' />
                                                                  </a><button type='button'
                                                                      onclick='deleteItem(this);'>삭제</button>
                                                              </p>
                                                              <input type="hidden" id="fileSeqNo"
                                                                  name="fileSeqNo"
                                                                  value="<c:out value='${baseApplyFileList.fileSeqNo[j.index]}'/>" />
                                                          </li>
                                                      </c:forEach>
                                                  </ul>
                                              </div>
                                              <div class="Lexplanation displayInPhone">
                                                  <p>
                                                      <LTag:message code="com.inf.029" />
                                                  </p>
                                                  <ul class="LblockItemList Lfile">
                                                      <c:forEach
                                                          items="${baseApplyFileList.attachFileId}"
                                                          varStatus="j">
                                                          <li style="">
                                                              <c:out
                                                                  value='${baseApplyFileList.dlFileName[j.index]}' />
                                                          </li>
                                                      </c:forEach>
                                                  </ul>
                                              </div>
                                          </td>
                                      </tr>
                                  </c:when>
                                  <c:otherwise>
                                      <c:if test="${jobNoticeInfo.addressFlag == 'N'}">
                                          <tr>
                                              <th scope="row" style="width:20%;"><label
                                                      class="required" for="address"><span
                                                          class="Lhide">(필수)</span>
                                                      <LTag:message code="app.lbl.currentAddress" /><!--현주소-->
                                                  </label></th>
                                              <td colspan="3">
                                                  <p class="currentLocation">
                                                      <span>
                                                          <input type="radio"
                                                              id="currentLocation_domestic"
                                                              name="address" value="A"
                                                              checked="checked" /><label
                                                              for="currentLocation_domestic">
                                                              <LTag:message
                                                                  code="app.lbl.domesticAddress" />
                                                          </label>
                                                          <input type="radio"
                                                              id="currentLocation_abroad"
                                                              name="address" value="O" <c:if
                                                              test="${applyMasterInfo.typeCode == 'O'}">
                                                          checked='checked'
                                      </c:if> /> <label for="currentLocation_abroad">
                                          <LTag:message code="app.lbl.overseaAddress" />
                                      </label>
                                      </span>
                                      <span class="lineInPhone">
                                          <button type="button" id="postPopup"
                                              onclick="dui.Calendar.close();searchAddrPopup(this);">
                                              <LTag:message code="com.lbl.postCode" />
                                          </button>
                                          <span class="input_search" id="countryDiv">
                                              <input type="text" id="countryName" name="countryName"
                                                  size="10"
                                                  value="<c:out value='${applyMasterInfo.countryName}'/>"
                                                  readonly="readonly" title="국적 검색" />
                                              <input type="hidden" id="countryCode" name="countryCode"
                                                  value="<c:out value='${applyMasterInfo.countryCode}'/>" />
                                              <button type="button"
                                                  onclick="searchCodePopup(this,'NA');">검색</button>
                                          </span>
                                          <input type="text" id="postalCode" name="postalCode"
                                              class="zipcode" size="10"
                                              value="<c:out value='${applyMasterInfo.postalCode}'/>"
                                              readonly="readonly" maxlength="20"
                                              title="<LTag:message code=" com.lbl.postCode" />" />
                                      </span>
                                      <input type="text" id="addressLine1Info" name="addressLine1Info"
                                          class="mainAddress" size="40"
                                          value="<c:out value='${applyMasterInfo.addressLine1Info}'/>"
                                          readonly="readonly" maxlength="1000" title="주소" />
                                      </p>
                                      <p class="currentLocation">
                                          <input id="addressLine2Info" name="addressLine2Info"
                                              type="text" style="width:78.9%;" size="60"
                                              value="<c:out value='${applyMasterInfo.addressLine2Info}' />"
                                              maxlength="1000" title="상세 주소"
                                              placeholder="<LTag:message code='com.inf.006'/>" />
                                      </p>
                                      </td>
                                      </tr>
                                      </c:if>
                                  </c:otherwise>
                              </c:choose>
                          </tbody>
                      </table>
                  </div>
                  <div class="additionalTips">
                      <p>
                          <LTag:message code="app.cont.additionalTips" />
                      </p>
                      <c:if
                          test="${jobNoticeInfo.recruitTypeCode == 'D' || jobNoticeInfo.recruitTypeCode == 'H'}">
                          <p>모든 첨부파일 크기의 총합이 3MB 이하가 되어야 합니다.</p>
                      </c:if>
                  </div>
              </div>
          </div>

          <div class="foldedInphone">
              <div class="dtFoldedInPhone">
                  <div class="LblockPageSubtitle">
                      <h3>
                          <LTag:message code="app.lbl.applyChannel" />
                      </h3>
                  </div>
              </div>
              <div class="ddFoldedInPhone">
                  <div class="LblockDetailTable">
                      <table class="applicationform rsp rsp-hori rsp-tablet">
                          <caption>
                              <LTag:message code="app.lbl.applyChannel" />
                          </caption>
                          <tbody>
                              <tr>
                                  <th scope="row" style="width:15%"><label class="required"
                                          for="applychannelCode">
                                          <LTag:message code="app.lbl.applyChannel" />
                                      </label></th>
                                  <td style="width:35%">
                                      <span class="set_selectInput">
                                          <select id="applychannelCode" name="applychannelCode"
                                              class="minwidth100" style="min-width: 220px;">
                                              <option value="">
                                                  <LTag:message code="app.lbl.select" />
                                              </option>
                                              <c:forEach items="${applyChannelList.code}"
                                                  varStatus="l">
                                                  <option
                                                      value="<c:out value='${applyChannelList.code[l.index]}' />"
                                                      <c:if
                                                      test="${applyChannelList.code[l.index] == baseInfo.applychannelCode }">
                                                      selected </c:if>>
                                                      <c:out
                                                          value='${applyChannelList.value[l.index]}' />
                                                  </option>
                                              </c:forEach>
                                          </select>
                                      </span>
                                  </td>
                                  <th scope="row" style="width:15%" id="channelDetail"><label
                                          class="required" for="applychannelDetailText">
                                          <LTag:message code="app.lbl.applyChannelDetail" />
                                      </label></th>
                                  <td style="width:35%" id="channelDetailInput">
                                      <input title="지원채널 상세내용" type="text" id="applychannelDetailText"
                                          class="blockInPhone" name="applychannelDetailText" size="10"
                                          style="width:79%;"
                                          value="<c:out value='${baseInfo.applychannelDetailText}' />"
                                          maxlength="100" />
                                  </td>
                                  <th scope="row" style="width:15%" id="applyPlatform"><label
                                          class="required" for="applyplatformCode">
                                          <LTag:message code="app.lbl.applyPlatform" />
                                      </label></th>
                                  <td style="width:35%" id="applyPlatformSelect">
                                      <select id="applyplatformCode" name="applyplatformCode"">
                                <option value=""><LTag:message code=" app.lbl.select" /></option>
                                      <c:forEach items="${applyPlatformList.code}" varStatus="i">
                                          <option
                                              value="<c:out value='${applyPlatformList.code[i.index]}' />"
                                              <c:if
                                              test="${baseInfo.applyplatformCode == applyPlatformList.code[i.index]}">
                                              selected </c:if>>
                                              <c:out value='${applyPlatformList.value[i.index]}' />
                                          </option>
                                      </c:forEach>
                                      </select>
                                      <input title="기타 플랫폼" type="text" id="applyplatformEtc"
                                          class="blockInPhone" name="applyplatformEtc" size="10"
                                          style="width:30%;"
                                          value="<c:out value='${baseInfo.applyplatformEtc}' />"
                                          maxlength="100" />
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                  </div>

                  <div class="additionalTips">
                      <p>
                          <LTag:message code="app.cont.applyChannelTips" />
                      </p>
                  </div>
              </div>
          </div>


          <c:if
              test="${jobNoticeInfo.recruitTypeCode != 'D' && jobNoticeInfo.recruitTypeCode != 'H'}">
              <c:if test="${jobNoticeInfo.militaryInputFlag == 'N'}">
                  <div class="foldedInphone">
                      <div class="dtFoldedInPhone">
                          <div class="LblockPageSubtitle">
                              <h3>
                                  <LTag:message code="app.titl.milCont" />
                              </h3>
                          </div>
                      </div>
                      <div class="ddFoldedInPhone">
                          <div class="LblockDetailTable">
                              <table class="applicationform rsp rsp-hori rsp-tablet">
                                  <caption>
                                      <LTag:message code="app.titl.milCont" />
                                  </caption>
                                  <tbody>
                                      <tr>
                                          <th scope="row" style="width:15%"><label
                                                  for="milDischargeCode" class="required"><span
                                                      class="Lhide">(필수)</span>
                                                  <LTag:message code="app.lbl.milDischargeCode" />
                                              </label></th>
                                          <td style="width:35%">
                                              <select id="milDischargeCode" name="milDischargeCode">
                                                  <option value="">
                                                      <LTag:message code="app.lbl.select" />
                                                  </option>
                                                  <c:forEach items="${militaryDisChanList.code}"
                                                      varStatus="i">
                                                      <option
                                                          value="<c:out value='${militaryDisChanList.code[i.index]}'/>"
                                                          <c:if
                                                          test="${baseInfo.milDischargeCode == militaryDisChanList.code[i.index]}">
                                                          selected
              </c:if>>
              <c:out value='${militaryDisChanList.value[i.index]}' />
              </option>
              </c:forEach>
              </select>
              </td>
              <th scope="row" style="width:15%"><label for="militaryClassCode">
                      <LTag:message code="app.lbl.militaryClassCode" />
                  </label></th>
              <td style="width:35%">
                  <select id="militaryClassCode" name="militaryClassCode">
                      <option value="">
                          <LTag:message code="app.lbl.select" />
                      </option>
                      <c:forEach items="${militarySrvPartList.code}" varStatus="i">
                          <option value="<c:out value='${militarySrvPartList.code[i.index]}' />" <c:if
                              test="${baseInfo.militaryClassCode == militarySrvPartList.code[i.index]}">
                              selected
          </c:if>>
          <c:out value='${militarySrvPartList.value[i.index]}' />
          </option>
          </c:forEach>
          </select>
          </td>
          </tr>
          <tr>
              <th scope="row" style="width:15%"><label for="milGrageCode">
                      <LTag:message code="app.lbl.milGrageCode" />
                  </label></th>
              <td style="width:35%">
                  <select id="milGrageCode" name="milGrageCode">
                      <option value="">
                          <LTag:message code="app.lbl.select" />
                      </option>
                      <c:forEach items="${milGrageCodeList.code}" varStatus="i">
                          <option value="<c:out value='${milGrageCodeList.code[i.index]}' />" <c:if
                              test="${baseInfo.milGrageCode == milGrageCodeList.code[i.index]}">
                              selected </c:if>>
                              <c:out value='${milGrageCodeList.value[i.index]}' />
                          </option>
                      </c:forEach>
                  </select>
              </td>
              <th scope="row" style="width:15%"><label for="milStartDate">
                      <LTag:message code="app.lbl.milPeriodDate" />
                  </label></th>
              <td style="width:35%">
                  <input type="text" class="Ltext" id="milStartDate" name="milStartDate" size="11"
                      value="<c:out value='${baseInfo.milStartDate}' />" readonly="readonly"
                      title="<LTag:message code=" app.lbl.milPeriodDate" /> 시작일">
                  <button type="button" id="milStartDate_cal" class="LiconCalendar"
                      data-calendar="milStartDate">달력</button>
                  <label>~</label>
                  <input type="text" class="Ltext" id="milEndDate" name="milEndDate" size="11"
                      value="<c:out value='${baseInfo.milEndDate}' />" readonly="readonly"
                      title="<LTag:message code=" app.lbl.milPeriodDate" /> 종료일">
                  <button type="button" id="milEndDate_cal" class="LiconCalendar"
                      data-calendar="milEndDate">달력</button>
              </td>
          </tr>
          <tr>
              <th scope="row" style="width:15%"><label for="milExmptReasonCode">
                      <LTag:message code="app.lbl.milExmptReasonCode" />
                  </label></th>
              <td style="width:35%">
                  <select id="milExmptReasonCode" name="milExmptReasonCode">
                      <option value="">
                          <LTag:message code="app.lbl.select" />
                      </option>
                      <c:forEach items="${milExeReList.code}" varStatus="i">
                          <option value="<c:out value='${milExeReList.code[i.index]}' />" <c:if
                              test="${baseInfo.milExmptReasonCode == milExeReList.code[i.index]}">
                              selected </c:if>>
                              <c:out value='${milExeReList.value[i.index]}' />
                          </option>
                      </c:forEach>
                  </select>
              </td>
              <th scope="row" style="width:15%" class="crapInto1Line"><label
                      for="milExmptDetailReason">
                      <LTag:message code="app.lbl.milExmptDetailReason" />
                  </label></th>
              <td style="width:35%">
                  <input type="text" id="milExmptDetailReason" name="milExmptDetailReason"
                      value="<c:out value='${baseInfo.milExmptDetailReason}' />" maxlength="50"
                      disabled="disabled" />
              </td>
          </tr>
          </tbody>
          </table>
      </div>

      <div class="additionalTips">
      </div>
</div>
</div>
</c:if>

<c:if test="${jobNoticeInfo.etcInputFlag == 'N'}">
  <div class="foldedInphone">
      <div class="dtFoldedInPhone">
          <div class="LblockPageSubtitle">
              <h3>
                  <LTag:message code="app.titl.jobPreferEmploy" />
              </h3>
          </div>
      </div>
      <div class="ddFoldedInPhone">
          <div class="LblockDetailTable">
              <table class="applicationform rsp rsp-hori rsp-tablet">
                  <caption>
                      <LTag:message code="app.titl.jobPreferEmploy" />
                  </caption>
                  <tbody>
                      <tr>
                          <th scope="row" style="width:15%;"><label class="required"
                                  for="veteranTypeCode"><span class="Lhide">(필수)</span>
                                  <LTag:message code="app.lbl.veteranFlag" />
                              </label></th>
                          <td style="width:35%;">
                              <select id="veteranTypeCode" name="veteranTypeCode">
                                  <option value="">
                                      <LTag:message code="app.lbl.notApplicable" />
                                  </option>
                                  <c:forEach items="${veteranTypeList.code}" varStatus="i">
                                      <option
                                          value="<c:out value='${veteranTypeList.code[i.index]}' />"
                                          <c:if
                                          test="${baseInfo.veteranTypeCode == veteranTypeList.code[i.index]}">
                                          selected
</c:if>>
<c:out value='${veteranTypeList.value[i.index]}' />
</option>
</c:forEach>
</select>
</td>
<th scope="row" style="width:15%;"><label for="veteranCode">
      <LTag:message code="app.lbl.veteranCode" />
  </label></th>
<td style="width:35%;">
  <input id="veteranCode" name="veteranCode" type="text" disabled="disabled"
      value="<c:out value='${baseInfo.veteranCode}' />" maxlength="20" />
</td>
</tr>
<tr>
  <th scope="row" style="width:15%;"><label for="veteranRelationship">보훈대상과관계</label></th>
  <td style="width:35%;">
      <select id="veteranRelationship" name="veteranRelationship" disabled="disabled">
          <option value="">
              <LTag:message code="app.lbl.select" />
          </option>
          <c:forEach items="${veteranRelationshipList.code}" varStatus="i">
              <option value="<c:out value='${veteranRelationshipList.code[i.index]}' />" <c:if
                  test="${baseInfo.veteranRelationship == veteranRelationshipList.code[i.index]}">
                  selected </c:if>>
                  <c:out value='${veteranRelationshipList.value[i.index]}' />
              </option>
          </c:forEach>
      </select>
  </td>
  <th scope="row" style="width:15%;"><label for="veteranTypeCode">취업보호대상자</label></th>
  <td style="width:35%;">
      <input type="radio" id="veteranEmploymentFlag_yes" name="veteranEmploymentFlag"
          disabled="disabled" value="Y" <c:if test="${baseInfo.veteranEmploymentFlag=='Y'}">
      checked="checked" </c:if> ><label for="engineeringAccrFlag_yes">Yes</label>
      <input type="radio" id="veteranEmploymentFlag_no" name="veteranEmploymentFlag"
          disabled="disabled" value="N" <c:if test="${baseInfo.veteranEmploymentFlag!='Y'}">
      checked="checked" </c:if> ><label for="engineeringAccrFlag_no">No</label>
  </td>
</tr>
<tr>
  <th scope="row" style="width:15%;"><label class="required" for="disabilityTypeCode"><span
              class="Lhide">(필수)</span>
          <LTag:message code="app.lbl.disabilityFlag" />
      </label></th>
  <td style="width:35%;">
      <select id="disabilityTypeCode" name="disabilityTypeCode">
          <option value="">
              <LTag:message code="app.lbl.notApplicable" />
          </option>
          <c:forEach items="${disabilityTypeList.code}" varStatus="i">
              <option value="<c:out value='${disabilityTypeList.code[i.index]}' />" <c:if
                  test="${baseInfo.disabilityTypeCode == disabilityTypeList.code[i.index]}"> selected
                  </c:if>>
                  <c:out value='${disabilityTypeList.value[i.index]}' />
              </option>
          </c:forEach>
      </select>
  </td>
  <th scope="row" style="width:15%;"><label class="required" for="disabilityGradeCode"><span
              class="Lhide">(필수)</span>
          <LTag:message code="app.lbl.disabilityGrade" />
      </label></th>
  <td style="width:35%;">
      <select id="disabilityGradeCode" name="disabilityGradeCode" disabled="disabled">
          <option value="">
              <LTag:message code="app.lbl.select" />
          </option>
          <c:forEach items="${disabilityGradeList.code}" varStatus="i">
              <option value="<c:out value='${disabilityGradeList.code[i.index]}'/>" <c:if
                  test="${baseInfo.disabilityGradeCode == disabilityGradeList.code[i.index]}">
                  selected </c:if>>
                  <c:out value='${disabilityGradeList.value[i.index]}' />
              </option>
          </c:forEach>
      </select>
  </td>
</tr>
<%-- FPT - Static Analysis Handle - DELETE --%>
  <c:if test="${jobNoticeInfo.lowIncomeInputFlag == 'Y'}">
  </c:if>
  </tbody>
  </table>
  </div>
  <c:choose>

      <%-- 저소득층 정보 입력받는 경우의 가이드 메세지 --%>
          <c:when test="${jobNoticeInfo.lowIncomeInputFlag == 'Y'}">
              <%-- FPT - Static Analysis Handle - DELETE --%>
          </c:when>

          <%-- 저소득층 정보 입력받지 않는 경우의 가이드 메세지 --%>
              <c:otherwise>
                  <div class="additionalTips">
                      <p>
                          <LTag:message code="app.cont.preferCont1_5" />
                      </p>
                      <p>
                          <LTag:message code="app.cont.preferCont1_2" />
                      </p>
                  </div>
              </c:otherwise>
  </c:choose>
  </div>
  </div>
  </c:if>

  <div class="LblockTabButton">
      <button type="button" id="btnSaveBaseInfo"><span>
              <LTag:message code="com.btn.save" />
          </span></button>
      <button type="button" onclick="nextTab(this,1);"><span>
              <LTag:message code="com.btn.next" />
          </span></button>
  </div>
  </c:if>
  <c:if test="${jobNoticeInfo.recruitTypeCode == 'D' || jobNoticeInfo.recruitTypeCode == 'H'}">
      <div class="LblockTabButton">

          <div class="LblockApplyAgree"
              style="display: inline-block; margin-right: 15px; font-weight: bold; ">
              <input type="checkbox" id="applyAgreeFlag" name="applyAgreeFlag" value="Y" />
              <label for="applyAgreeFlag">입력한 내용은 사실과 틀림없음을 확인합니다.</label>
          </div>

          <button type="button" id="btnUploadBaseSumbit"><span>
                  <LTag:message code="app.btn.confSubmit" />
              </span></button>
      </div>
  </c:if>
  </form>
  </div>
================================================================================================
  <c:if test="${jobNoticeInfo.recruitTypeCode != 'D' && jobNoticeInfo.recruitTypeCode != 'H'}">
      <div id="LblockTabContent02" class="LblockTabContent">
          <form id="appDetailForm" name="appDetailForm" method="post" enctype="multipart/form-data">
              <rec:savedToken name="sessionscopedetail" scope="session" />
              <h2 class="Lhide">
                  <LTag:message code="app.tab.detailInfo" />
              </h2>
              <div class="LviewExplanation">
                  <p><strong>
                          <LTag:message code="app.btn.applyWriteGuide" />
                      </strong><a href="#" onclick="applcationGuidePopup();">
                          <LTag:message code="app.cont.view" />
                      </a></p>
              </div>
              <c:if
                  test="${!empty beforeDetailInfo.jobNoticeId && (jobNoticeInfo.schoolInputFlag == 'N' || jobNoticeInfo.qualificationInputFlag == 'N' || jobNoticeInfo.languageInputFlag == 'N' || jobNoticeInfo.globalInputFlag == 'N')}">
                  <div class="LblockPageLink">
                      <p id="beforeDetail" class="links">
                          <LTag:message code="app.cont.topCont_1" /> <a href="#"
                              onClick="retrieveBeforeDetailInfo();">
                              <LTag:message code="app.cont.topCont_6" />
                          </a>
                      </p>
                  </div>
              </c:if>
              <c:if test="${jobNoticeInfo.schoolInputFlag == 'N'}">
                  <div class="LtableDescription applicationform">
                      <h3 style="margin:0 0 5px;">최종 학력을 선택하세요. (선택 후 학력 입력란이 활성화됩니다.)</h3>
                      <div class=Linformation>
                          <p style="color:#d80546;">졸업예정자의 경우 최종학력은 졸업예정 학력으로 선택하여 작성바랍니다.</p>
                      </div>
                      <p class="Lselectbox">
                          <select title="최종학력" id="degreeType" name="degreeType">
                              <option value="">
                                  <LTag:message code="app.lbl.select" />
                              </option>
                              <c:forEach items="${degreeTypeList.code}" varStatus="i">
                                  <%-- FPT - Static Analysis Handle - DELETE --%>
                                      <c:choose>
                                          <c:when
                                              test="${jobNoticeInfo.recruitTypeCode == 'I' || jobNoticeInfo.recruitTypeCode == 'J'}">
                                              <c:if
                                                  test="${degreeTypeList.code[i.index] != 'M' && degreeTypeList.code[i.index] != 'E'}">
                                                  <option
                                                      value="<c:out value='${degreeTypeList.code[i.index]}' />"
                                                      <c:if
                                                      test="${degreeType == degreeTypeList.code[i.index]}">
                                                      selected
                                              </c:if>>
                                              <c:out value='${degreeTypeList.value[i.index]}' />
                                              </option>
              </c:if>
              </c:when>
              <c:otherwise>
                  <c:if
                      test="${!(jobNoticeInfo.highschoolFlag == 'Y' && degreeTypeList.code[i.index] == 'H')  && !(jobNoticeInfo.middleschInputFlag == 'Y' && degreeTypeList.code[i.index] == 'M') && !(jobNoticeInfo.elemschInputFlag == 'Y' && degreeTypeList.code[i.index] == 'E')}">
                      <option value="<c:out value='${degreeTypeList.code[i.index]}' />" <c:if
                          test="${degreeType == degreeTypeList.code[i.index]}"> selected
                  </c:if>>
                  <c:out value='${degreeTypeList.value[i.index]}' />
                  </option>
  </c:if>
  </c:otherwise>
  </c:choose>

  </c:forEach>
  </select>
  </p>
  </div>

  <!-- 초등학교 -->
  <c:if test="${jobNoticeInfo.elemschInputFlag == 'N'}">
      <div id="elemschoolDiv" style="display:none">
          <div class="foldedInphone">
              <div class="dtFoldedInPhone btnmore">
                  <div class="LblockPageSubtitle">
                      <h3>
                          <LTag:message code="app.titl.elemschool" />
                      </h3>
                      <div class="subtitleBtn">
                          <a href="#" class="btn_erase" onclick="fnEraseData('elemschoolDiv');"><span
                                  class="Lhide">
                                  <LTag:message code="app.titl.elemschool" /> 입력
                              </span>지우기</a>
                      </div>
                  </div>
              </div>
              <div class="ddFoldedInPhone">
                  <div class="LblockDetailTable">
                      <table class="applicationform rsp rsp-hori rsp-tablet">
                          <caption>
                              <LTag:message code="app.titl.elemschool" />
                          </caption>
                          <tbody>
                              <tr>
                                  <th scope="row" style="width:15%;"><label class="required"
                                          for="elemSchoolName"><span class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.schoolName" />
                                      </label></th>
                                  <td style="width:35%;">
                                      <div class="input_search">
                                          <input type="text" id="elemSchoolName" name="elemSchoolName"
                                              size="10" readonly="readonly"
                                              value="<c:out value='${elemInfo.schoolName}' />" />
                                          <input type="hidden" id="elemSchoolCode"
                                              name="elemSchoolCode"
                                              value="<c:out value='${elemInfo.schoolCode}' />" />
                                          <button type="button"
                                              onclick="searchSchoolPopup(this,'E');">검색</button>
                                      </div>
                                  </td>
                                  <th scope="row" style="width:15%;"><label class="required"
                                          for="elemLocationName"><span class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.locationName" />
                                      </label></th>
                                  <td style="width:35%;">
                                      <div class="input_search">
                                          <input type="text" id="elemLocationName"
                                              name="elemLocationName" size="10"
                                              value="<c:out value='${elemInfo.locationName}' />"
                                              readonly="readonly" maxlength="300" />
                                          <input type="hidden" id="elemAddressSido"
                                              name="elemAddressSido"
                                              value="<c:out value='${elemInfo.addressSido}' />" />
                                          <input type="hidden" id="elemAddressSigu"
                                              name="elemAddressSigu"
                                              value="<c:out value='${elemInfo.addressSigu}' />" />
                                          <button type="button"
                                              onclick="searchSchoolLocPopup(this);">검색</button>
                                      </div>
                                  </td>
                              </tr>
                              <tr>
                                  <th scope="row" style="width:15%;"><label class="required"><span
                                              class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.preriodDate" />
                                      </label></th>
                                  <td style="width:35%;">
                                      <input type="text" class="Ltext" id="elemstartDate"
                                          name="elemstartDate"
                                          value="<c:out value='${elemInfo.startDate}' />" size="11"
                                          maxlength="11" readonly="readonly"
                                          title="<LTag:message code=" app.lbl.preriodDate" /> 시작일" />
                                      <button type="button" class="LiconCalendar"
                                          data-calendar="elemstartDate">달력</button>
                                      <label>~</label>
                                      <input type="text" class="Ltext" id="elemendDate"
                                          name="elemendDate" size="11"
                                          value="<c:out value='${elemInfo.endDate}' />" maxlength="11"
                                          readonly="readonly" title="<LTag:message code="
                                          app.lbl.preriodDate" /> 종료일" />
                                      <button type="button" class="LiconCalendar"
                                          data-calendar="elemendDate">달력</button>
                                  </td>
                                  <th scope="row" style="width:15%;"><label class="required"
                                          for="elemGraduationStatusCode"><span
                                              class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.graduationFlag" />
                                      </label></th>
                                  <td style="width:35%;">
                                      <select id="elemGraduationStatusCode"
                                          name="elemGraduationStatusCode">
                                          <option value="">
                                              <LTag:message code="app.lbl.select" />
                                          </option>
                                          <c:forEach items="${graduationList.code}" varStatus="i">
                                              <option
                                                  value="<c:out value='${graduationList.code[i.index]}' />"
                                                  <c:if
                                                  test="${elemInfo.graduationStatusCode == graduationList.code[i.index]}">
                                                  selected
  </c:if>>
  <c:out value='${graduationList.value[i.index]}' />
  </option>
  </c:forEach>
  </select>
  </td>
  </tr>
  </tbody>
  </table>
  </div>
  <div class="additionalTips">
  </div>
  </div>
  </div>
  </div>
  </c:if>

  <!-- 중학교  -->
  <c:if test="${jobNoticeInfo.middleschInputFlag == 'N'}">
      <div id="middleschoolDiv" style="display:none">
          <div class="foldedInphone">
              <div class="dtFoldedInPhone btnmore">
                  <div class="LblockPageSubtitle">
                      <h3>
                          <LTag:message code="app.titl.middleschool" />
                      </h3>
                      <div class="subtitleBtn">
                          <a href="#" class="btn_erase"
                              onclick="fnEraseData('middleschoolDiv');"><span class="Lhide">
                                  <LTag:message code="app.titl.middleschool" /> 입력
                              </span>지우기</a>
                      </div>
                  </div>
              </div>
              <div class="ddFoldedInPhone">
                  <div class="LblockDetailTable">
                      <table class="applicationform rsp rsp-hori rsp-tablet">
                          <caption>
                              <LTag:message code="app.titl.middleschool" />
                          </caption>
                          <tbody>
                              <tr>
                                  <th scope="row" style="width:15%;"><label class="required"
                                          for="middleSchoolName"><span class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.schoolName" />
                                      </label></th>
                                  <td style="width:35%;">
                                      <div class="input_search">
                                          <input type="text" id="middleSchoolName"
                                              name="middleSchoolName" size="10" readonly="readonly"
                                              value="<c:out value='${middleInfo.schoolName}' />" />
                                          <input type="hidden" id="middleSchoolCode"
                                              name="middleSchoolCode"
                                              value="<c:out value='${middleInfo.schoolCode}' />" />
                                          <button type="button"
                                              onclick="searchSchoolPopup(this,'D');">검색</button>
                                      </div>
                                  </td>
                                  <th scope="row" style="width:15%;"><label class="required"
                                          for="middleLocationName"><span class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.locationName" />
                                      </label></th>
                                  <td style="width:35%;">
                                      <div class="input_search">
                                          <input type="text" id="middleLocationName"
                                              name="middleLocationName" size="10"
                                              value="<c:out value='${middleInfo.locationName}' />"
                                              readonly="readonly" maxlength="300" />
                                          <input type="hidden" id="middleAddressSido"
                                              name="middleAddressSido"
                                              value="<c:out value='${middleInfo.addressSido}' />" />
                                          <input type="hidden" id="middleAddressSigu"
                                              name="middleAddressSigu"
                                              value="<c:out value='${middleInfo.addressSigu}' />" />
                                          <button type="button"
                                              onclick="searchSchoolLocPopup(this);">검색</button>
                                      </div>
                                  </td>
                              </tr>
                              <tr>
                                  <th scope="row" style="width:15%;"><label class="required"><span
                                              class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.preriodDate" />
                                      </label></th>
                                  <td style="width:35%;">
                                      <input type="text" class="Ltext" id="middlestartDate"
                                          name="middlestartDate"
                                          value="<c:out value='${middleInfo.startDate}' />" size="11"
                                          maxlength="11" readonly="readonly"
                                          title="<LTag:message code=" app.lbl.preriodDate" /> 시작일" />
                                      <button type="button" class="LiconCalendar"
                                          data-calendar="middlestartDate">달력</button>
                                      <label>~</label>
                                      <input type="text" class="Ltext" id="middleendDate"
                                          name="middleendDate" size="11"
                                          value="<c:out value='${middleInfo.endDate}' />"
                                          maxlength="11" readonly="readonly"
                                          title="<LTag:message code=" app.lbl.preriodDate" /> 종료일" />
                                      <button type="button" class="LiconCalendar"
                                          data-calendar="middleendDate">달력</button>
                                  </td>
                                  <th scope="row" style="width:15%;"><label class="required"
                                          for="middleGraduationStatusCode"><span
                                              class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.graduationFlag" />
                                      </label></th>
                                  <td style="width:35%;">
                                      <select id="middleGraduationStatusCode"
                                          name="middleGraduationStatusCode">
                                          <option value="">
                                              <LTag:message code="app.lbl.select" />
                                          </option>
                                          <c:forEach items="${graduationList.code}" varStatus="i">
                                              <option
                                                  value="<c:out value='${graduationList.code[i.index]}' />"
                                                  <c:if
                                                  test="${middleInfo.graduationStatusCode == graduationList.code[i.index]}">
                                                  selected
  </c:if>>
  <c:out value='${graduationList.value[i.index]}' />
  </option>
  </c:forEach>
  </select>
  </td>
  </tr>
  </tbody>
  </table>
  </div>
  <div class="additionalTips">
  </div>
  </div>
  </div>
  </div>
  </c:if>

  <!-- 고등학교 -->
  <c:if test="${jobNoticeInfo.highschoolFlag == 'N'}">


      <div id="highschoolDiv" style="display:none">
          <div class="foldedInphone">
              <div class="dtFoldedInPhone btnmore">
                  <div class="LblockPageSubtitle">
                      <h3>
                          <LTag:message code="app.titl.highschool" />
                      </h3>
                      <div class="subtitleBtn">
                          <a href="#" class="btn_erase" onclick="fnEraseData('highschoolDiv');"><span
                                  class="Lhide">
                                  <LTag:message code="app.titl.highschool" /> 입력
                              </span>지우기</a>
                      </div>
                  </div>
              </div>
              <div class="ddFoldedInPhone">
                  <div class="LblockDetailTable">
                      <table class="applicationform rsp rsp-hori rsp-tablet">
                          <caption>
                              <LTag:message code="app.titl.highschool" />
                          </caption>
                          <tbody>
                              <tr>
                                  <th scope="row" style="width:15%;"><label class="required"
                                          for="highSchoolName"><span class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.schoolName" />
                                      </label></th>
                                  <td style="width:35%;">
                                      <div class="input_search">
                                          <input type="text" id="highSchoolName" name="highSchoolName"
                                              size="10" readonly="readonly"
                                              value="<c:out value='${highInfo.schoolName}' />" />
                                          <input type="hidden" id="highSchoolCode"
                                              name="highSchoolCode"
                                              value="<c:out value='${highInfo.schoolCode}' />" />
                                          <button type="button"
                                              onclick="searchSchoolPopup(this,'H');">검색</button>
                                      </div>
                                  </td>
                                  <th scope="row" style="width:15%;"><label class="required"
                                          for="highLocationName"><span class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.locationName" />
                                      </label></th>
                                  <td style="width:35%;">
                                      <div class="input_search">
                                          <input type="text" id="highLocationName"
                                              name="highLocationName" size="10"
                                              value="<c:out value='${highInfo.locationName}' />"
                                              readonly="readonly" maxlength="300" />
                                          <input type="hidden" id="highAddressSido"
                                              name="highAddressSido"
                                              value="<c:out value='${highInfo.addressSido}' />" />
                                          <input type="hidden" id="highAddressSigu"
                                              name="highAddressSigu"
                                              value="<c:out value='${highInfo.addressSigu}' />" />
                                          <button type="button"
                                              onclick="searchSchoolLocPopup(this);">검색</button>
                                      </div>
                                  </td>
                              </tr>
                              <tr>
                                  <th scope="row" style="width:15%;"><label class="required"><span
                                              class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.preriodDate" />
                                      </label></th>
                                  <td style="width:35%;">
                                      <input type="text" class="Ltext" id="highstartDate"
                                          name="highstartDate"
                                          value="<c:out value='${highInfo.startDate}' />" size="11"
                                          maxlength="11" readonly="readonly"
                                          title="<LTag:message code=" app.lbl.preriodDate" /> 시작일" />
                                      <button type="button" class="LiconCalendar"
                                          data-calendar="highstartDate">달력</button>
                                      <label>~</label>
                                      <input type="text" class="Ltext" id="highendDate"
                                          name="highendDate" size="11"
                                          value="<c:out value='${highInfo.endDate}' />" maxlength="11"
                                          readonly="readonly" title="<LTag:message code="
                                          app.lbl.preriodDate" /> 종료일" />
                                      <button type="button" class="LiconCalendar"
                                          data-calendar="highendDate">달력</button>
                                  </td>
                                  <th scope="row" style="width:15%;"><label class="required"
                                          for="highGraduationStatusCode"><span
                                              class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.graduationFlag" />
                                      </label></th>
                                  <td style="width:35%;">
                                      <select id="highGraduationStatusCode"
                                          name="highGraduationStatusCode">
                                          <option value="">
                                              <LTag:message code="app.lbl.select" />
                                          </option>
                                          <c:forEach items="${graduationList.code}" varStatus="i">
                                              <option
                                                  value="<c:out value='${graduationList.code[i.index]}' />"
                                                  <c:if
                                                  test="${highInfo.graduationStatusCode == graduationList.code[i.index]}">
                                                  selected
  </c:if>>
  <c:out value='${graduationList.value[i.index]}' />
  </option>
  </c:forEach>
  </select>
  </td>
  </tr>
  <tr>
      <th scope="row" style="width:15%;"><label class="required" for="highStudyTypeCode"><span
                  class="Lhide">(필수)</span>
              <LTag:message code="app.lbl.detailMajorName" />
          </label></th>
      <td colspan="3" style="width:85%;" class="selectInputText">
          <select id="highStudyTypeCode" name="highStudyTypeCode" class="minwidth100">
              <option value="">
                  <LTag:message code="app.lbl.select" />
              </option>
              <c:forEach items="${studyTypeList.code}" varStatus="i">
                  <option value="<c:out value='${studyTypeList.code[i.index]}' />" <c:if
                      test="${highInfo.studyTypeCode == studyTypeList.code[i.index]}"> selected
                      </c:if>>
                      <c:out value='${studyTypeList.value[i.index]}' />
                  </option>
              </c:forEach>
          </select>
          <input title="<LTag:message code=" app.lbl.detailMajorName" /> 직접입력" type="text"
          id="detailMajorName" name="detailMajorName" size="20" disabled="disabled" value="
          <c:out value='${highInfo.detailMajorName}' />" maxlength="100" />
      </td>
  </tr>
  <c:if
      test="${jobNoticeInfo.highschRankInputFlag == 'N' || jobNoticeInfo.highschAttendInputFlag == 'N'}">
      <tr>
          <th scope="row" style="width:15%;"><label>생활기록부 등</label></th>
          <td colspan="3" style="width:85%;" class="td_file">
              <div class="set_selectInput hiddenInPhone hiddenInTablet">
                  <c:if test="${i.index == 0}">
                      <input type="hidden" id="deleteFileSeqNo" name="deleteFileSeqNo" />
                  </c:if>
                  <input type="hidden" id="highattachFileId_${i.index+1}"
                      name="highattachFileId_${i.index+1}"
                      value="<c:out value='${highInfo.attachFileId}'/>" />
                  <button type="button" class="btn_file"
                      onclick="addItem('#highThesis_${i.index+1}','high_${i.index+1}');"><span>
                          <LTag:message code="app.lbl.addAttachFile" />
                      </span></button>
                  <ul id="highThesis_${i.index+1}" class="LblockItemList Lfile">
                      <c:forEach items="${schoolFileList.attachFileId}" varStatus="k">
                          <c:if
                              test="${schoolFileList.attachFileId[k.index] == highInfo.attachFileId}">
                              <li style="">
                                  <p><a href="javascript:;"
                                          onClick="fileDownload('${schoolFileList.dlFileName[k.index]}','${schoolFileList.attachFileId[k.index]}')">
                                          <c:out value='${schoolFileList.dlFileName[k.index]}' />
                                      </a><button type='button'
                                          onclick='deleteItem(this);'>삭제</button></p>
                                  <input type="hidden" id="fileSeqNo" name="fileSeqNo"
                                      value="<c:out value='${schoolFileList.fileSeqNo[k.index]}'/>" />
                                  <input type="hidden" id="hightDlFileName" name="hightDlFileName"
                                      value="<c:out value='${schoolFileList.dlFileName[k.index]}'/>" />
                              </li>
                          </c:if>
                      </c:forEach>
                  </ul>
              </div>
              <div class="Lexplanation displayInPhone">
                  <p>
                      <LTag:message code="com.inf.029" />
                  </p>
                  <ul class="LblockItemList Lfile">
                      <c:forEach items="${schoolFileList.attachFileId}" varStatus="j">
                          <c:if
                              test="${schoolFileList.attachFileId[k.index] == highInfo.attachFileId}">
                              <li style="">
                                  <c:out value='${schoolFileList.dlFileName[k.index]}' />
                              </li>
                          </c:if>
                      </c:forEach>
                  </ul>
              </div>
          </td>
      </tr>
  </c:if>
  </tbody>
  </table>
  </div>
  <div class="additionalTips">
      <c:if
          test="${jobNoticeInfo.highschRankInputFlag == 'N' || jobNoticeInfo.highschAttendInputFlag == 'N'}">
          <p>첨부 파일은 1개만 가능하며 파일 형식은 JPG, PNG, PDF 만 가능합니다. 파일 용량은 3MB 이내로 등록 바랍니다.</p>
      </c:if>
  </div>
  </div>
  </div>

  </div><!-- 고등학교 end -->
  </c:if>

  <!-- 고교생활현황 -->
  <c:if test="${jobNoticeInfo.highschAttendInputFlag == 'N'}">
      <div id="highschAttendDiv" style="display:none">
          <div class="foldedInphone">
              <div class="dtFoldedInPhone btnmore">
                  <div class="LblockPageSubtitle">
                      <h3>
                          <LTag:message code="app.titl.highschAttend" />
                      </h3>
                      <div class="subtitleBtn">
                          <a href="#" class="btn_erase"
                              onclick="fnEraseData('highschAttendDiv');"><span class="Lhide">
                                  <LTag:message code="app.titl.highschAttend" /> 입력
                              </span>지우기</a>
                      </div>
                  </div>
              </div>
              <div class="ddFoldedInPhone">
                  <div class="LblockListTable headerTop">
                      <table class="applyformHeaderTop rsp rsp-basic">
                          <caption>
                              <LTag:message code="app.titl.highschAttend" />
                          </caption>
                          <thead>
                              <tr>
                                  <th scope="col" style="width:12%;" rowspan="2">
                                      <LTag:message code="app.lbl.recruitType" />
                                  </th>
                                  <th scope="col" style="width:22%;" colspan="3"><label
                                          class="required" for="">결석일수</label></th>
                                  <th scope="col" style="width:22%;" colspan="3"><label
                                          class="required" for="">지각</label></th>
                                  <th scope="col" style="width:22%;" colspan="3"><label
                                          class="required" for="">조퇴</label></th>
                                  <th scope="col" style="width:22%;" colspan="3"><label
                                          class="required" for="">결과</label></th>
                              </tr>
                              <tr>
                                  <th scope="col" style="width:7%;" title="결석일수-질병"><label
                                          class="required" for="attendabsentDis">질병</label></th>
                                  <th scope="col" style="width:7%;" title="결석일수-무단"><label
                                          class="required" for="attendabsentNot">무단</label></th>
                                  <th scope="col" style="width:8%;" title="결석일수-기타"><label
                                          class="required" for="attendabsentEtc">기타</label></th>
                                  <th scope="col" style="width:7%;" title="지각-질병"><label
                                          class="required" for="attendlateDis">질병</label></th>
                                  <th scope="col" style="width:7%;" title="지각-무단"><label
                                          class="required" for="attendlateNot">무단</label></th>
                                  <th scope="col" style="width:8%;" title="지각-기타"><label
                                          class="required" for="attendlateEtc">기타</label></th>
                                  <th scope="col" style="width:7%;" title="조퇴-질병"><label
                                          class="required" for="attendshortDis">질병</label></th>
                                  <th scope="col" style="width:7%;" title="조퇴-무단"><label
                                          class="required" for="attendshortNot">무단</label></th>
                                  <th scope="col" style="width:8%;" title="조퇴-기타"><label
                                          class="required" for="attendshortEtc">기타</label></th>
                                  <th scope="col" style="width:7%;" title="결과-질병"><label
                                          class="required" for="attendmissedDis">질병</label></th>
                                  <th scope="col" style="width:7%;" title="결과-무단"><label
                                          class="required" for="attendmissedNot">무단</label></th>
                                  <th scope="col" style="width:8%;" title="결과-기타"><label
                                          class="required" for="attendmissedEtc">기타</label></th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td style="width:12%;">전체합계</td>
                                  <td style="width:7%;"><input type="text" id="attendabsentDis"
                                          name="attendabsentDis"
                                          value="<c:out value='${highschAttendInfo.absentDis[0]}'/>"
                                          size="5" maxlength="3" title="질병"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                                  <td style="width:7%;"><input type="text" id="attendabsentNot"
                                          name="attendabsentNot"
                                          value="<c:out value='${highschAttendInfo.absentNot[0]}'/>"
                                          size="5" maxlength="3" title="무단"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                                  <td style="width:8%;"><input type="text" id="attendabsentEtc"
                                          name="attendabsentEtc"
                                          value="<c:out value='${highschAttendInfo.absentEtc[0]}'/>"
                                          size="5" maxlength="3" title="기타"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                                  <td style="width:7%;"><input type="text" id="attendlateDis"
                                          name="attendlateDis"
                                          value="<c:out value='${highschAttendInfo.lateDis[0]}'/>"
                                          size="5" maxlength="3" title="질병"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                                  <td style="width:7%;"><input type="text" id="attendlateNot"
                                          name="attendlateNot"
                                          value="<c:out value='${highschAttendInfo.lateNot[0]}'/>"
                                          size="5" maxlength="3" title="무단"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                                  <td style="width:8%;"><input type="text" id="attendlateEtc"
                                          name="attendlateEtc"
                                          value="<c:out value='${highschAttendInfo.lateEtc[0]}'/>"
                                          size="5" maxlength="3" title="기타"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                                  <td style="width:7%;"><input type="text" id="attendshortDis"
                                          name="attendshortDis"
                                          value="<c:out value='${highschAttendInfo.shortDis[0]}'/>"
                                          size="5" maxlength="3" title="질병"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                                  <td style="width:7%;"><input type="text" id="attendshortNot"
                                          name="attendshortNot"
                                          value="<c:out value='${highschAttendInfo.shortNot[0]}'/>"
                                          size="5" maxlength="3" title="무단"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                                  <td style="width:8%;"><input type="text" id="attendshortEtc"
                                          name="attendshortEtc"
                                          value="<c:out value='${highschAttendInfo.shortEtc[0]}'/>"
                                          size="5" maxlength="3" title="기타"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                                  <td style="width:7%;"><input type="text" id="attendmissedDis"
                                          name="attendmissedDis"
                                          value="<c:out value='${highschAttendInfo.missedDis[0]}'/>"
                                          size="5" maxlength="3" title="질병"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                                  <td style="width:7%;"><input type="text" id="attendmissedNot"
                                          name="attendmissedNot"
                                          value="<c:out value='${highschAttendInfo.missedNot[0]}'/>"
                                          size="5" maxlength="3" title="무단"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                                  <td style="width:8%;"><input type="text" id="attendmissedEtc"
                                          name="attendmissedEtc"
                                          value="<c:out value='${highschAttendInfo.missedEtc[0]}'/>"
                                          size="5" maxlength="3" title="기타"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                              </tr>
                          </tbody>
                      </table>

                      <table class="applyformHeaderTop rsp rsp-basic">
                          <caption></caption>
                          <thead>
                              <tr>
                                  <th scope="col" style="width:12%;"><label>
                                          <LTag:message code="app.lbl.recruitType" />
                                      </label></th>
                                  <th scope="col" style="width:13%;"><label class="required"
                                          for="attendschoolDays">수업일수</label></th>
                                  <th scope="col" style="width:75%;"><label class="required"
                                          for="attendawardRecord">수상경력</label></th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td style="width:12%;" class="tBlock">전체합계</td>
                                  <td style="width:13%;"><input type="text" id="attendschoolDays"
                                          name="attendschoolDays"
                                          value="<c:out value='${highschAttendInfo.schoolDays[0]}'/>"
                                          size="10" maxlength="3" title="수업일수"
                                          onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                          style="ime-mode:disabled;"
                                          onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
                                  <td style="width:75%;"><input type="text" id="attendawardRecord"
                                          name="attendawardRecord"
                                          value="<c:out value='${highschAttendInfo.awardRecord[0]}'/>"
                                          size="110" maxlength="100" title="수상경력"></td>
                              </tr>

                          </tbody>
                      </table>

                  </div>

                  <div class="additionalTips">
                      <p>수상경력은 100글자 이내로 입력해주시기 바랍니다.</p>
                  </div>
              </div>

          </div>
      </div>

  </c:if>


  <!-- 고교성적상세 과목수에 따라 모두 그림 -->
  <c:if test="${jobNoticeInfo.highschRankInputFlag == 'N'}">
      <div id="highschRankDiv" style="display:none">
          <div class="foldedInphone">
              <div class="dtFoldedInPhone btnmore">
                  <div class="LblockPageSubtitle">
                      <h3>
                          <LTag:message code="app.titl.highschRank" />
                      </h3>
                      <div class="subtitleBtn">
                          <a href="#" class="btn_erase" onclick="fnEraseData('highschRankDiv');"><span
                                  class="Lhide">
                                  <LTag:message code="app.titl.highschAttend" /> 입력
                              </span>지우기</a>
                      </div>
                  </div>
              </div>

              <div class="ddFoldedInPhone">
                  <div class="LblockListTable headerTop">
                      <table id="highschrankTable" class="applyformHeaderTop rsp rsp-basic">
                          <caption>
                              <LTag:message code="app.titl.highschRank" />
                          </caption>
                          <colgroup>
                              <col style="width:12%;" />
                              <col style="width:14%;" />
                              <col style="width:10%;" />
                              <col style="width:10%;" />
                              <col style="width:10%;" />
                              <col style="width:14%;" />
                              <col style="width:10%;" />
                              <col style="width:10%;" />
                              <col style="width:10%;" />
                          </colgroup>
                          <thead>
                              <%-- FPT - Static Analysis Handle - DELETE --%>
                                  <tr>
                                      <th scope="col"><label class="required" for="">학년</label></th>
                                      <th scope="col"><label class="required"
                                              for="rankschCourseFrt">1학기 과목</label></th>
                                      <th scope="col"><label class="required"
                                              for="rankschCreditFrt">단위수</label></th>
                                      <th scope="col"><label class="required"
                                              for="rankschRankFrt">석차등급</label></th>
                                      <th scope="col"><label class="required"
                                              for="rankschNosesFrt">수강인원</label></th>
                                      <th scope="col"><label class="required"
                                              for="rankschCourseSnd">2학기 과목</label></th>
                                      <th scope="col"><label class="required"
                                              for="rankschCreditSnd">단위수</label></th>
                                      <th scope="col"><label class="required"
                                              for="rankschRankSnd">석차등급</label></th>
                                      <th scope="col"><label class="required"
                                              for="rankschNosesSnd">수강인원</label></th>
                                  </tr>

                          </thead>
                          <tbody>
                              <c:forEach items="${highschRankList.schoolGrade}" varStatus="i">
                                  <tr>
                                      <td><input type="hidden" id="rankschoolGrade_${i.index}"
                                              name="rankschoolGrade_${i.index}"
                                              value="<c:out value='${highschRankList.schoolGrade[i.index]}'/>">${highschRankList.schoolGrade[i.index]}
                                      </td>
                                      <td><input type="text" id="rankschCourseFrt_${i.index}"
                                              name="rankschCourseFrt_${i.index}"
                                              value="<c:out value='${highschRankList.schCourseFrt[i.index]}'/>"
                                              size="15" maxlength="8" title="과목"></td>
                                      <td><input type="text" id="rankschCreditFrt_${i.index}"
                                              name="rankschCreditFrt_${i.index}"
                                              value="<c:out value='${highschRankList.schCreditFrt[i.index]}'/>"
                                              size="10" maxlength="5" title="단위수"></td>
                                      <td><input type="text" id="rankschRankFrt_${i.index}"
                                              name="rankschRankFrt_${i.index}"
                                              value="<c:out value='${highschRankList.schRankFrt[i.index]}'/>"
                                              size="10" maxlength="5" title="석차등급"></td>
                                      <td><input type="text" id="rankschNosesFrt_${i.index}"
                                              name="rankschNosesFrt_${i.index}"
                                              value="<c:out value='${highschRankList.schNosesFrt[i.index]}'/>"
                                              size="10" maxlength="5" title="수강수"></td>
                                      <td><input type="text" id="rankschCourseSnd_${i.index}"
                                              name="rankschCourseSnd_${i.index}"
                                              value="<c:out value='${highschRankList.schCourseSnd[i.index]}'/>"
                                              size="10" maxlength="8" title="과목"></td>
                                      <td><input type="text" id="rankschCreditSnd_${i.index}"
                                              name="rankschCreditSnd_${i.index}"
                                              value="<c:out value='${highschRankList.schCreditSnd[i.index]}'/>"
                                              size="10" maxlength="5" title="단위수"></td>
                                      <td><input type="text" id="rankschRankSnd_${i.index}"
                                              name="rankschRankSnd_${i.index}"
                                              value="<c:out value='${highschRankList.schRankSnd[i.index]}'/>"
                                              size="10" maxlength="5" title="석차등급"></td>
                                      <td><input type="text" id="rankschNosesSnd_${i.index}"
                                              name="rankschNosesSnd_${i.index}"
                                              value="<c:out value='${highschRankList.schNosesSnd[i.index]}'/>"
                                              size="10" maxlength="5" title="수강수"></td>
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table>
                  </div>
                  <div class="additionalTips">
                      <p>성적은 고등학교 생활기록부에 근거하여 입력해주시고, 입력과목 선정 기준은 단위수가 높은 상위
                          <c:out value="${jobNoticeInfo.highschRankCourse}" />개 과목 기입<br>
                          ① 동일 단위수 과목이 있는 경우: 과학, 영어, 수학, 국어, 전공(실업계, 특성화고, 특목고) 교과 순으로 기재<br>
                          ② 석차등급 미표기 과목 제외(Ex. 예체능 과목)
                      </p>
                      <p>성적이 성취도로 표기되는 경우 A→1, B→3, C→5, D→7, E→9로 입력하시고, 성적이 석차로 표기되는 경우는 석차등급란에 해당
                          과목의 석차를 입력</p>
                      <p>빈칸이 있는 경우 모든 빈칸에 반드시 "." 입력해야 다음 단계로 넘어갈 수 있음(Ex. 과목수가
                          <c:out value="${jobNoticeInfo.highschRankCourse}" />개 미만인 경우)
                      </p>
                  </div>
              </div>

          </div>

      </div>
  </c:if>

  <!-- 전문대학 -->
  <div id="collegeDiv" style="display:none">
      <div class="foldedInphone">
          <div class="dtFoldedInPhone btnmore">
              <div class="LblockPageSubtitle more">
                  <h3>
                      <LTag:message code="app.lbl.college" /> <span id="collegeCount">(
                          <c:out value='${collegeInfoCount}' />)
                      </span>
                  </h3>
                  <div class="additionalTips" style="margin:0px">
                      <p>
                          <LTag:message code="app.cont.additionalTip12" />
                      </p>
                      <p>
                          <LTag:message code="app.cont.additionalTip7" />
                      </p>
                  </div>
                  <h4>
                      <LTag:message code="app.cont.collegeCont_1" />
                  </h4>
                  <div class="subtitleBtn">
                      <a href="#" class="btn_erase" onclick="fnEraseData('collegeDiv');"><span
                              class="Lhide">
                              <LTag:message code="app.lbl.college" /> 입력
                          </span>지우기</a>
                      <a href="#" class="btn_more" id="collegeAddBtn"><span class="Lhide">
                              <LTag:message code="app.lbl.college" />
                          </span>추가</a>
                  </div>
              </div>
          </div>
          <div class="ddFoldedInPhone">
              <c:forEach items="${collegeInfo.jobNoticeId}" varStatus="i">
                  <c:if test="${i.index != 0}">
                      <div class="btn_deleteTable"><button type="button"
                              onClick="delDataInfo(this,'coll');">다음 항목 삭제</button></div>
                  </c:if>
                  <div class="LblockDetailTable">
                      <%-- 비즈니스 로직에서 학교이름의 키를 파싱해서 숫자를 세므로 학교이름이 필수가 아닌 상황에서 로직을 맞춰주기위해 순번을 넣음. --%>
                          <input type="hidden" id="collegeschoolSeqno_${i.index+1}"
                              name="collegeschoolSeqno_${i.index+1}" value="${i.index+1}" />
                          <table class="applicationform rsp rsp-hori rsp-tablet">
                              <caption>
                                  <LTag:message code="app.lbl.college" />
                              </caption>
                              <colgroup>
                                  <col style="width:15%;" />
                                  <col style="width:35%;" />
                                  <col style="width:15%;" />
                                  <col style="width:35%;" />
                              </colgroup>
                              <tbody>
                                  <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                      <%-- 학교명 / 소재지 표시 --%>
                                          <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                              <c:choose>
                                                  <c:when
                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                      SCHOOL_NAME\"') &&
                                                      fn:contains(jobNoticeInfo.schoolInputSelected, '\"LOCATION\"'
                                                      )}">

                                                      <%-- 학교명, 소재지 모두 입력받음 --%>

                                                          <tr>
                                                              <th scope="row"><label class="required"
                                                                      for="collegeschoolName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.schoolName" />
                                                                  </label></th>
                                                              <td>
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="collegeschoolName_${i.index+1}"
                                                                          name="collegeschoolName_${i.index+1}"
                                                                          size="10"
                                                                          readonly="readonly"
                                                                          value="<c:out value='${collegeInfo.schoolName[i.index]}' />" />
                                                                      <input type="hidden"
                                                                          id="collegeschoolCode_${i.index+1}"
                                                                          name="collegeschoolCode_${i.index+1}"
                                                                          value="<c:out value='${collegeInfo.schoolCode[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolPopup(this,'C');">검색</button>
                                                                  </div>
                                                              </td>
                                                              <th scope="row"><label class="required"
                                                                      for="collegelocationName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.locationName" />
                                                                  </label></th>
                                                              <td>
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="collegelocationName_${i.index+1}"
                                                                          name="collegelocationName_${i.index+1}"
                                                                          value="<c:out value='${collegeInfo.locationName[i.index]}' />"
                                                                          readonly="readonly"
                                                                          maxlength="300" />
                                                                      <input type="hidden"
                                                                          id="collegeaddressSido_${i.index+1}"
                                                                          name="collegeaddressSido_${i.index+1}"
                                                                          value="<c:out value='${collegeInfo.addressSido[i.index]}' />" />
                                                                      <input type="hidden"
                                                                          id="collegeaddressSigu_${i.index+1}"
                                                                          name="collegeaddressSigu_${i.index+1}"
                                                                          value="<c:out value='${collegeInfo.addressSigu[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolLocPopup(this);">검색</button>
                                                                  </div>
                                                              </td>
                                                          </tr>
                                                  </c:when>
                                                  <c:when
                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                      SCHOOL_NAME\"')}">

                                                      <%-- 학교명 만 입력받음 --%>

                                                          <tr>
                                                              <th scope="row"><label class="required"
                                                                      for="collegeschoolName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.schoolName" />
                                                                  </label></th>
                                                              <td colspan="3">
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="collegeschoolName_${i.index+1}"
                                                                          name="collegeschoolName_${i.index+1}"
                                                                          size="10"
                                                                          readonly="readonly"
                                                                          value="<c:out value='${collegeInfo.schoolName[i.index]}' />" />
                                                                      <input type="hidden"
                                                                          id="collegeschoolCode_${i.index+1}"
                                                                          name="collegeschoolCode_${i.index+1}"
                                                                          value="<c:out value='${collegeInfo.schoolCode[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolPopup(this,'C');">검색</button>
                                                                  </div>
                                                              </td>
                                                          </tr>
                                                  </c:when>
                                                  <c:when
                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                      LOCATION\"')}">

                                                      <%-- 소재지 만 입력받음 --%>

                                                          <tr>
                                                              <th scope="row"><label class="required"
                                                                      for="collegelocationName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.locationName" />
                                                                  </label></th>
                                                              <td colspan="3">
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="collegelocationName_${i.index+1}"
                                                                          name="collegelocationName_${i.index+1}"
                                                                          value="<c:out value='${collegeInfo.locationName[i.index]}' />"
                                                                          readonly="readonly"
                                                                          maxlength="300" />
                                                                      <input type="hidden"
                                                                          id="collegeaddressSido_${i.index+1}"
                                                                          name="collegeaddressSido_${i.index+1}"
                                                                          value="<c:out value='${collegeInfo.addressSido[i.index]}' />" />
                                                                      <input type="hidden"
                                                                          id="collegeaddressSigu_${i.index+1}"
                                                                          name="collegeaddressSigu_${i.index+1}"
                                                                          value="<c:out value='${collegeInfo.addressSigu[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolLocPopup(this);">검색</button>
                                                                  </div>
                                                              </td>
                                                          </tr>
                                                  </c:when>
                                              </c:choose>

                                              <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                                  <%-- 기간 / 졸업구분 표시 --%>
                                                      <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                                          <c:choose>
                                                              <c:when
                                                                  test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                  PERIOD\"') &&
                                                                  fn:contains(jobNoticeInfo.schoolInputSelected, '\"GRADUATION_STATUS\"'
                                                                  )}">

                                                                  <%-- 기간, 졸업구분 모두 입력받음 --%>

                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="collegestartDate_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.preriodDate" />
                                                                              </label></th>
                                                                          <td>
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="collegestartDate_${i.index+1}"
                                                                                  name="collegestartDate_${i.index+1}"
                                                                                  value="<c:out value='${collegeInfo.startDate[i.index]}' />"
                                                                                  size="11"
                                                                                  maxlength="11"
                                                                                  readonly="readonly"
                                                                                  title="기간 시작일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="collegestartCal_${i.index+1}"
                                                                                  data-calendar="collegestartDate_${i.index+1}">달력</button>
                                                                              <label>~</label>
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="collegeendDate_${i.index+1}"
                                                                                  name="collegeendDate_${i.index+1}"
                                                                                  value="<c:out value='${collegeInfo.endDate[i.index]}' />"
                                                                                  size="11"
                                                                                  maxlength="11"
                                                                                  readonly="readonly"
                                                                                  title="기간 종료일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="collegeendCal_${i.index+1}"
                                                                                  data-calendar="collegeendDate_${i.index+1}">달력</button>
                                                                          </td>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="collegegraduationStatusCode_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.graduationFlag" />
                                                                              </label></th>
                                                                          <td>
                                                                              <select
                                                                                  id="collegegraduationStatusCode_${i.index+1}"
                                                                                  name="collegegraduationStatusCode_${i.index+1}">
                                                                                  <option value="">
                                                                                      <LTag:message
                                                                                          code="app.lbl.select" />
                                                                                  </option>
                                                                                  <c:forEach
                                                                                      items="${graduationList.code}"
                                                                                      varStatus="l">
                                                                                      <option
                                                                                          value="<c:out value='${graduationList.code[l.index]}' />"
                                                                                          <c:if
                                                                                          test="${collegeInfo.graduationStatusCode[i.index] == graduationList.code[l.index]}">
                                                                                          selected
                                                                                          </c:if>>
                                                                                          <c:out
                                                                                              value='${graduationList.value[l.index]}' />
                                                                                      </option>
                                                                                  </c:forEach>
                                                                              </select>
                                                                          </td>
                                                                      </tr>
                                                              </c:when>
                                                              <c:when
                                                                  test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                  PERIOD\"')}">

                                                                  <%-- 기간 만 입력받음 --%>

                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="collegestartDate_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.preriodDate" />
                                                                              </label></th>
                                                                          <td colspan="3">
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="collegestartDate_${i.index+1}"
                                                                                  name="collegestartDate_${i.index+1}"
                                                                                  value="<c:out value='${collegeInfo.startDate[i.index]}' />"
                                                                                  size="11"
                                                                                  maxlength="11"
                                                                                  readonly="readonly"
                                                                                  title="기간 시작일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="collegestartCal_${i.index+1}"
                                                                                  data-calendar="collegestartDate_${i.index+1}">달력</button>
                                                                              <label>~</label>
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="collegeendDate_${i.index+1}"
                                                                                  name="collegeendDate_${i.index+1}"
                                                                                  value="<c:out value='${collegeInfo.endDate[i.index]}' />"
                                                                                  size="11"
                                                                                  maxlength="11"
                                                                                  readonly="readonly"
                                                                                  title="기간 종료일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="collegeendCal_${i.index+1}"
                                                                                  data-calendar="collegeendDate_${i.index+1}">달력</button>
                                                                          </td>
                                                                      </tr>
                                                              </c:when>
                                                              <c:when
                                                                  test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                  GRADUATION_STATUS\"')}">

                                                                  <%-- 졸업구분 만 입력받음 --%>

                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="collegegraduationStatusCode_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.graduationFlag" />
                                                                              </label></th>
                                                                          <td colspan="3">
                                                                              <select
                                                                                  id="collegegraduationStatusCode_${i.index+1}"
                                                                                  name="collegegraduationStatusCode_${i.index+1}">
                                                                                  <option value="">
                                                                                      <LTag:message
                                                                                          code="app.lbl.select" />
                                                                                  </option>
                                                                                  <c:forEach
                                                                                      items="${graduationList.code}"
                                                                                      varStatus="l">
                                                                                      <option
                                                                                          value="<c:out value='${graduationList.code[l.index]}' />"
                                                                                          <c:if
                                                                                          test="${collegeInfo.graduationStatusCode[i.index] == graduationList.code[l.index]}">
                                                                                          selected
                                                                                          </c:if>>
                                                                                          <c:out
                                                                                              value='${graduationList.value[l.index]}' />
                                                                                      </option>
                                                                                  </c:forEach>
                                                                              </select>
                                                                          </td>
                                                                      </tr>
                                                              </c:when>
                                                          </c:choose>

                                                          <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                                              <%-- 전공명 / 전체평점 표시 --%>
                                                                  <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                                                      <c:choose>
                                                                          <c:when
                                                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                              MAJOR_NAME\"') &&
                                                                              fn:contains(jobNoticeInfo.schoolInputSelected, '\"GPA_POINT\"'
                                                                              )}">

                                                                              <%-- 전공명, 전체평점 모두 입력받음
                                                                                  --%>

                                                                                  <tr>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="collegemajorName_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.majorName" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td>
                                                                                          <div
                                                                                              class="input_search">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="collegemajorName_${i.index+1}"
                                                                                                  name="collegemajorName_${i.index+1}"
                                                                                                  size="25"
                                                                                                  readonly="readonly"
                                                                                                  value="<c:out value='${collegeInfo.majorName[i.index]}' />" />
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="collegemajorCode_${i.index+1}"
                                                                                                  name="collegemajorCode_${i.index+1}"
                                                                                                  value="<c:out value='${collegeInfo.majorCode[i.index]}' />" />
                                                                                              <button
                                                                                                  type="button"
                                                                                                  onClick="searchMajorPopup(this)">검색</button>
                                                                                          </div>
                                                                                      </td>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="collegegpaPoint_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.gpaPoint" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td>
                                                                                          <span
                                                                                              class="set_selectInput">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="collegegpaPoint_${i.index+1}"
                                                                                                  name="collegegpaPoint_${i.index+1}"
                                                                                                  value="<c:out value='${collegeInfo.gpaPoint[i.index]}'/>"
                                                                                                  maxlength="5"
                                                                                                  size="3"
                                                                                                  onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                                                  style="ime-mode:disabled;"
                                                                                                  onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                                              /
                                                                                              <select
                                                                                                  title="학점 총점"
                                                                                                  id="collegegpaPointCode_${i.index+1}"
                                                                                                  name="collegegpaPointCode_${i.index+1}"
                                                                                                  onChange="getText(this)">
                                                                                                  <option
                                                                                                      value="">
                                                                                                      <LTag:message
                                                                                                          code="app.lbl.select" />
                                                                                                  </option>
                                                                                                  <c:forEach
                                                                                                      items="${gpaTypeList.code}"
                                                                                                      varStatus="k">
                                                                                                      <option
                                                                                                          value="<c:out value='${gpaTypeList.code[k.index]}' />"
                                                                                                          <c:if
                                                                                                          test="${collegeInfo.gpaPointCode[i.index] == gpaTypeList.code[k.index]}">
                                                                                                          selected
                                                                                                          </c:if>
                                                                                                          >
                                                                                                          <c:out
                                                                                                              value='${gpaTypeList.value[k.index]}' />
                                                                                                      </option>
                                                                                                  </c:forEach>
                                                                                              </select>
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="collegegpaPointCodeVal_${i.index+1}"
                                                                                                  name="collegegpaPointCodeVal_${i.index+1}"
                                                                                                  value="<c:out value='${collegeInfo.gpaPointVal[i.index]}'/>" />
                                                                                          </span>
                                                                                      </td>
                                                                                  </tr>
                                                                          </c:when>
                                                                          <c:when
                                                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                              MAJOR_NAME\"')}">

                                                                              <%-- 전공명 만 입력받음 --%>

                                                                                  <tr>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="collegemajorName_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.majorName" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td colspan="3">
                                                                                          <div
                                                                                              class="input_search">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="collegemajorName_${i.index+1}"
                                                                                                  name="collegemajorName_${i.index+1}"
                                                                                                  size="25"
                                                                                                  readonly="readonly"
                                                                                                  value="<c:out value='${collegeInfo.majorName[i.index]}' />" />
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="collegemajorCode_${i.index+1}"
                                                                                                  name="collegemajorCode_${i.index+1}"
                                                                                                  value="<c:out value='${collegeInfo.majorCode[i.index]}' />" />
                                                                                              <button
                                                                                                  type="button"
                                                                                                  onClick="searchMajorPopup(this)">검색</button>
                                                                                          </div>
                                                                                      </td>
                                                                                  </tr>
                                                                          </c:when>
                                                                          <c:when
                                                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                              GPA_POINT\"')}">

                                                                              <%-- 전체평점 만 입력받음 --%>

                                                                                  <tr>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="collegegpaPoint_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.gpaPoint" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td colspan="3">
                                                                                          <span
                                                                                              class="set_selectInput">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="collegegpaPoint_${i.index+1}"
                                                                                                  name="collegegpaPoint_${i.index+1}"
                                                                                                  value="<c:out value='${collegeInfo.gpaPoint[i.index]}'/>"
                                                                                                  maxlength="5"
                                                                                                  size="3"
                                                                                                  onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                                                  style="ime-mode:disabled;"
                                                                                                  onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                                              /
                                                                                              <select
                                                                                                  title="학점 총점"
                                                                                                  id="collegegpaPointCode_${i.index+1}"
                                                                                                  name="collegegpaPointCode_${i.index+1}"
                                                                                                  onChange="getText(this)">
                                                                                                  <option
                                                                                                      value="">
                                                                                                      <LTag:message
                                                                                                          code="app.lbl.select" />
                                                                                                  </option>
                                                                                                  <c:forEach
                                                                                                      items="${gpaTypeList.code}"
                                                                                                      varStatus="k">
                                                                                                      <option
                                                                                                          value="<c:out value='${gpaTypeList.code[k.index]}' />"
                                                                                                          <c:if
                                                                                                          test="${collegeInfo.gpaPointCode[i.index] == gpaTypeList.code[k.index]}">
                                                                                                          selected
                                                                                                          </c:if>
                                                                                                          >
                                                                                                          <c:out
                                                                                                              value='${gpaTypeList.value[k.index]}' />
                                                                                                      </option>
                                                                                                  </c:forEach>
                                                                                              </select>
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="collegegpaPointCodeVal_${i.index+1}"
                                                                                                  name="collegegpaPointCodeVal_${i.index+1}"
                                                                                                  value="<c:out value='${collegeInfo.gpaPointVal[i.index]}'/>" />
                                                                                          </span>
                                                                                      </td>
                                                                                  </tr>
                                                                          </c:when>
                                                                      </c:choose>
                              </tbody>
                          </table>
                  </div>
              </c:forEach>
              <div id="addCollegeDiv"></div>
              <div class="additionalTips"></div>
          </div>
      </div>
  </div>

  <!-- 대학교 -->
  <div id="uniDiv" style="display:none">
      <div class="foldedInphone">
          <div class="dtFoldedInPhone btnmore">
              <div class="LblockPageSubtitle more">
                  <h3>
                      <LTag:message code="app.titl.uni" /> <span id="uniCount">(
                          <c:out value='${uniCount}' />)
                      </span>
                  </h3>
                  <h4>
                      <LTag:message code="app.cont.uniCont_1" />
                  </h4>
                  <div class="subtitleBtn">
                      <a href="#" class="btn_erase" onclick="fnEraseData('uniDiv');"><span
                              class="Lhide">
                              <LTag:message code="app.titl.uni" /> 입력
                          </span>지우기</a>
                      <a href="#" id="uniAddBtn" class="btn_more"><span class="Lhide">
                              <LTag:message code="app.titl.uni" />
                          </span>추가</a>
                  </div>
              </div>
          </div>
          <div class="ddFoldedInPhone">
              <c:forEach items="${uniInfo.jobNoticeId}" varStatus="i">
                  <c:if test="${i.index != 0}">
                      <div class="btn_deleteTable"><button type="button"
                              onClick="delDataInfo(this,'uni');">다음 항목 삭제</button></div>
                  </c:if>
                  <div class="LblockDetailTable">
                      <%-- 비즈니스 로직에서 학교이름의 키를 파싱해서 숫자를 세므로 학교이름이 필수가 아닌 상황에서 로직을 맞춰주기위해 순번을 넣음. --%>
                          <input type="hidden" id="unischoolSeqno_${i.index+1}"
                              name="unischoolSeqno_${i.index+1}" value="${i.index+1}" />
                          <table class="applicationform rsp rsp-hori rsp-tablet">
                              <caption>
                                  <LTag:message code="app.titl.uni" />
                              </caption>
                              <colgroup>
                                  <col style="width:18%;" />
                                  <col style="width:32%;" />
                                  <col style="width:18%;" />
                                  <col style="width:32%;" />
                              </colgroup>
                              <tbody>
                                  <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                      <%-- 학교명 / 소재지 표시 --%>
                                          <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                              <c:choose>
                                                  <c:when
                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                      SCHOOL_NAME\"') &&
                                                      fn:contains(jobNoticeInfo.schoolInputSelected, '\"LOCATION\"'
                                                      )}">

                                                      <%-- 학교명, 소재지 모두 입력받음 --%>

                                                          <tr>
                                                              <th scope="row"><label class="required"
                                                                      for="unischoolName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.schoolName" />
                                                                  </label></th>
                                                              <td>
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="unischoolName_${i.index+1}"
                                                                          name="unischoolName_${i.index+1}"
                                                                          size="10"
                                                                          readonly="readonly"
                                                                          value="<c:out value='${uniInfo.schoolName[i.index]}' />" />
                                                                      <input type="hidden"
                                                                          id="unischoolCode_${i.index+1}"
                                                                          name="unischoolCode_${i.index+1}"
                                                                          value="<c:out value='${uniInfo.schoolCode[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolPopup(this,'U');">검색</button>
                                                                  </div>
                                                              </td>
                                                              <th scope="row"><label class="required"
                                                                      for="unilocationName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.locationName" />
                                                                  </label></th>
                                                              <td>
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="unilocationName_${i.index+1}"
                                                                          name="unilocationName_${i.index+1}"
                                                                          value="<c:out value='${uniInfo.locationName[i.index]}' />"
                                                                          readonly="readonly"
                                                                          maxlength="300" />
                                                                      <input type="hidden"
                                                                          id="uniaddressSido_${i.index+1}"
                                                                          name="uniaddressSido_${i.index+1}"
                                                                          value="<c:out value='${uniInfo.addressSido[i.index]}' />" />
                                                                      <input type="hidden"
                                                                          id="uniaddressSigu_${i.index+1}"
                                                                          name="uniaddressSigu_${i.index+1}"
                                                                          value="<c:out value='${uniInfo.addressSigu[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolLocPopup(this);">검색</button>
                                                                  </div>
                                                              </td>
                                                          </tr>
                                                  </c:when>
                                                  <c:when
                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                      SCHOOL_NAME\"')}">

                                                      <%-- 학교명 만 입력받음 --%>

                                                          <tr>
                                                              <th scope="row"><label class="required"
                                                                      for="unischoolName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.schoolName" />
                                                                  </label></th>
                                                              <td colspan="3">
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="unischoolName_${i.index+1}"
                                                                          name="unischoolName_${i.index+1}"
                                                                          size="10"
                                                                          readonly="readonly"
                                                                          value="<c:out value='${uniInfo.schoolName[i.index]}' />" />
                                                                      <input type="hidden"
                                                                          id="unischoolCode_${i.index+1}"
                                                                          name="unischoolCode_${i.index+1}"
                                                                          value="<c:out value='${uniInfo.schoolCode[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolPopup(this,'U');">검색</button>
                                                                  </div>
                                                              </td>
                                                          </tr>
                                                  </c:when>
                                                  <c:when
                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                      LOCATION\"')}">

                                                      <%-- 소재지 만 입력받음 --%>

                                                          <tr>
                                                              <th scope="row"><label class="required"
                                                                      for="unilocationName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.locationName" />
                                                                  </label></th>
                                                              <td colspan="3">
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="unilocationName_${i.index+1}"
                                                                          name="unilocationName_${i.index+1}"
                                                                          value="<c:out value='${uniInfo.locationName[i.index]}' />"
                                                                          readonly="readonly"
                                                                          maxlength="300" />
                                                                      <input type="hidden"
                                                                          id="uniaddressSido_${i.index+1}"
                                                                          name="uniaddressSido_${i.index+1}"
                                                                          value="<c:out value='${uniInfo.addressSido[i.index]}' />" />
                                                                      <input type="hidden"
                                                                          id="uniaddressSigu_${i.index+1}"
                                                                          name="uniaddressSigu_${i.index+1}"
                                                                          value="<c:out value='${uniInfo.addressSigu[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolLocPopup(this);">검색</button>
                                                                  </div>
                                                              </td>
                                                          </tr>
                                                  </c:when>
                                              </c:choose>

                                              <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                                  <%-- 기간 / 졸업구분 표시 --%>
                                                      <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                                          <c:choose>
                                                              <c:when
                                                                  test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                  PERIOD\"') &&
                                                                  fn:contains(jobNoticeInfo.schoolInputSelected, '\"GRADUATION_STATUS\"'
                                                                  )}">

                                                                  <%-- 기간, 졸업구분 모두 입력받음 --%>

                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="unistartDate_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.preriodDate" />
                                                                              </label></th>
                                                                          <td>
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="unistartDate_${i.index+1}"
                                                                                  name="unistartDate_${i.index+1}"
                                                                                  size="11"
                                                                                  maxlength="11"
                                                                                  readonly="readonly"
                                                                                  value="<c:out value='${uniInfo.startDate[i.index]}' />"
                                                                                  title="기간 시작일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="unistartCal_${i.index+1}"
                                                                                  data-calendar="unistartDate_${i.index+1}">달력</button>
                                                                              <label>~</label>
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="uniendDate_${i.index+1}"
                                                                                  name="uniendDate_${i.index+1}"
                                                                                  size="11"
                                                                                  maxlength="11"
                                                                                  readonly="readonly"
                                                                                  value="<c:out value='${uniInfo.endDate[i.index]}' />"
                                                                                  title="기간 종료일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="uniendCal_${i.index+1}"
                                                                                  data-calendar="uniendDate_${i.index+1}">달력</button>
                                                                          </td>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="unigraduationStatusCode_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.graduationFlag" />
                                                                              </label></th>
                                                                          <td>
                                                                              <select
                                                                                  id="unigraduationStatusCode_${i.index+1}"
                                                                                  name="unigraduationStatusCode_${i.index+1}">
                                                                                  <option value="">
                                                                                      <LTag:message
                                                                                          code="app.lbl.select" />
                                                                                  </option>
                                                                                  <c:forEach
                                                                                      items="${graduationList.code}"
                                                                                      varStatus="l">
                                                                                      <option
                                                                                          value="<c:out value='${graduationList.code[l.index]}' />"
                                                                                          <c:if
                                                                                          test="${uniInfo.graduationStatusCode[i.index] == graduationList.code[l.index]}">
                                                                                          selected
                                                                                          </c:if>>
                                                                                          <c:out
                                                                                              value='${graduationList.value[l.index]}' />
                                                                                      </option>
                                                                                  </c:forEach>
                                                                              </select>
                                                                          </td>
                                                                      </tr>
                                                              </c:when>
                                                              <c:when
                                                                  test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                  PERIOD\"')}">

                                                                  <%-- 기간 만 입력받음 --%>

                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="unistartDate_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.preriodDate" />
                                                                              </label></th>
                                                                          <td colspan="3">
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="unistartDate_${i.index+1}"
                                                                                  name="unistartDate_${i.index+1}"
                                                                                  size="11"
                                                                                  maxlength="11"
                                                                                  readonly="readonly"
                                                                                  value="<c:out value='${uniInfo.startDate[i.index]}' />"
                                                                                  title="기간 시작일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="unistartCal_${i.index+1}"
                                                                                  data-calendar="unistartDate_${i.index+1}">달력</button>
                                                                              <label>~</label>
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="uniendDate_${i.index+1}"
                                                                                  name="uniendDate_${i.index+1}"
                                                                                  size="11"
                                                                                  maxlength="11"
                                                                                  readonly="readonly"
                                                                                  value="<c:out value='${uniInfo.endDate[i.index]}' />"
                                                                                  title="기간 종료일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="uniendCal_${i.index+1}"
                                                                                  data-calendar="uniendDate_${i.index+1}">달력</button>
                                                                          </td>
                                                                      </tr>
                                                              </c:when>
                                                              <c:when
                                                                  test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                  GRADUATION_STATUS\"')}">

                                                                  <%-- 졸업구분 만 입력받음 --%>

                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="unigraduationStatusCode_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.graduationFlag" />
                                                                              </label></th>
                                                                          <td colspan="3">
                                                                              <select
                                                                                  id="unigraduationStatusCode_${i.index+1}"
                                                                                  name="unigraduationStatusCode_${i.index+1}">
                                                                                  <option value="">
                                                                                      <LTag:message
                                                                                          code="app.lbl.select" />
                                                                                  </option>
                                                                                  <c:forEach
                                                                                      items="${graduationList.code}"
                                                                                      varStatus="l">
                                                                                      <option
                                                                                          value="<c:out value='${graduationList.code[l.index]}' />"
                                                                                          <c:if
                                                                                          test="${uniInfo.graduationStatusCode[i.index] == graduationList.code[l.index]}">
                                                                                          selected
                                                                                          </c:if>>
                                                                                          <c:out
                                                                                              value='${graduationList.value[l.index]}' />
                                                                                      </option>
                                                                                  </c:forEach>
                                                                              </select>
                                                                          </td>
                                                                      </tr>
                                                              </c:when>
                                                          </c:choose>

                                                          <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                                              <%-- 전공명 / 부복수전공 구분 표시 --%>
                                                                  <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                                                      <c:choose>
                                                                          <c:when
                                                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                              MAJOR_NAME\"') &&
                                                                              fn:contains(jobNoticeInfo.schoolInputSelected, '\"MINOR_TYPE\"'
                                                                              )}">

                                                                              <%-- 전공명, 부복수전공 구분 모두
                                                                                  입력받음 --%>

                                                                                  <tr>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="unimajorName_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.majorName" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td>
                                                                                          <div
                                                                                              class="input_search">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="unimajorName_${i.index+1}"
                                                                                                  name="unimajorName_${i.index+1}"
                                                                                                  size="10"
                                                                                                  readonly="readonly"
                                                                                                  value="<c:out value='${uniInfo.majorName[i.index]}' />" />
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="unimajorCode_${i.index+1}"
                                                                                                  name="unimajorCode_${i.index+1}"
                                                                                                  value="<c:out value='${uniInfo.majorCode[i.index]}' />" />
                                                                                              <button
                                                                                                  type="button"
                                                                                                  onClick="searchMajorPopup(this)">검색</button>
                                                                                          </div>
                                                                                      </td>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              for="uniminorType_${i.index+1}">
                                                                                              <LTag:message
                                                                                                  code="app.lbl.minorName" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td>
                                                                                          <span
                                                                                              class="set_selectInput">
                                                                                              <select
                                                                                                  id="uniminorType_${i.index+1}"
                                                                                                  name="uniminorType_${i.index+1}"
                                                                                                  title="부/복수전공 선택"
                                                                                                  class="minwidth100"
                                                                                                  <c:if
                                                                                                  test="${jobNoticeInfo.addSchoolFlag == 'N'}">
                                                                                                  onchange="onMinorChange(this);"
                                                                                                  </c:if>
                                                                                                  >
                                                                                                  <option
                                                                                                      value="">
                                                                                                      <LTag:message
                                                                                                          code="app.lbl.select" />
                                                                                                  </option>
                                                                                                  <c:forEach
                                                                                                      items="${minorTypeList.code}"
                                                                                                      varStatus="z">
                                                                                                      <option
                                                                                                          value="<c:out value='${minorTypeList.code[z.index]}' />"
                                                                                                          <c:if
                                                                                                          test="${uniInfo.minorType[i.index] == minorTypeList.code[z.index]}">
                                                                                                          selected
                                                                                                          </c:if>
                                                                                                          >
                                                                                                          <c:out
                                                                                                              value='${minorTypeList.value[z.index]}' />
                                                                                                      </option>
                                                                                                  </c:forEach>

                                                                                              </select>
                                                                                              <span
                                                                                                  class="input_search">
                                                                                                  <input
                                                                                                      type="text"
                                                                                                      id="uniminorName_${i.index+1}"
                                                                                                      name="uniminorName_${i.index+1}"
                                                                                                      value="<c:out value='${uniInfo.minorName[i.index]}' />"
                                                                                                      size="10"
                                                                                                      readonly="readonly"
                                                                                                      title="전공명" />
                                                                                                  <input
                                                                                                      type="hidden"
                                                                                                      id="uniminorCode_${i.index+1}"
                                                                                                      name="uniminorCode_${i.index+1}"
                                                                                                      value="<c:out value='${uniInfo.minorCode[i.index]}' />" />
                                                                                                  <button
                                                                                                      type="button"
                                                                                                      onClick="searchMajorPopup(this)">검색</button>
                                                                                              </span>
                                                                                          </span>
                                                                                      </td>
                                                                                  </tr>
                                                                          </c:when>
                                                                          <c:when
                                                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                              MAJOR_NAME\"')}">

                                                                              <%-- 전공명 만 입력받음 --%>

                                                                                  <tr>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="unimajorName_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.majorName" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td colspan="3">
                                                                                          <div
                                                                                              class="input_search">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="unimajorName_${i.index+1}"
                                                                                                  name="unimajorName_${i.index+1}"
                                                                                                  size="10"
                                                                                                  readonly="readonly"
                                                                                                  value="<c:out value='${uniInfo.majorName[i.index]}' />" />
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="unimajorCode_${i.index+1}"
                                                                                                  name="unimajorCode_${i.index+1}"
                                                                                                  value="<c:out value='${uniInfo.majorCode[i.index]}' />" />
                                                                                              <button
                                                                                                  type="button"
                                                                                                  onClick="searchMajorPopup(this)">검색</button>
                                                                                          </div>
                                                                                      </td>
                                                                                  </tr>
                                                                          </c:when>
                                                                          <c:when
                                                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                              MINOR_TYPE\"')}">

                                                                              <%-- 부복수전공 구분 만 입력받음
                                                                                  --%>

                                                                                  <tr>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              for="uniminorType_${i.index+1}">
                                                                                              <LTag:message
                                                                                                  code="app.lbl.minorName" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td colspan="3">
                                                                                          <span
                                                                                              class="set_selectInput">
                                                                                              <select
                                                                                                  id="uniminorType_${i.index+1}"
                                                                                                  name="uniminorType_${i.index+1}"
                                                                                                  title="부/복수전공 선택"
                                                                                                  class="minwidth100"
                                                                                                  <c:if
                                                                                                  test="${jobNoticeInfo.addSchoolFlag == 'N'}">
                                                                                                  onchange="onMinorChange(this);"
                                                                                                  </c:if>
                                                                                                  >
                                                                                                  <option
                                                                                                      value="">
                                                                                                      <LTag:message
                                                                                                          code="app.lbl.select" />
                                                                                                  </option>
                                                                                                  <c:forEach
                                                                                                      items="${minorTypeList.code}"
                                                                                                      varStatus="z">
                                                                                                      <option
                                                                                                          value="<c:out value='${minorTypeList.code[z.index]}' />"
                                                                                                          <c:if
                                                                                                          test="${uniInfo.minorType[i.index] == minorTypeList.code[z.index]}">
                                                                                                          selected
                                                                                                          </c:if>
                                                                                                          >
                                                                                                          <c:out
                                                                                                              value='${minorTypeList.value[z.index]}' />
                                                                                                      </option>
                                                                                                  </c:forEach>

                                                                                              </select>
                                                                                              <span
                                                                                                  class="input_search">
                                                                                                  <input
                                                                                                      type="text"
                                                                                                      id="uniminorName_${i.index+1}"
                                                                                                      name="uniminorName_${i.index+1}"
                                                                                                      value="<c:out value='${uniInfo.minorName[i.index]}' />"
                                                                                                      size="10"
                                                                                                      readonly="readonly"
                                                                                                      title="전공명" />
                                                                                                  <input
                                                                                                      type="hidden"
                                                                                                      id="uniminorCode_${i.index+1}"
                                                                                                      name="uniminorCode_${i.index+1}"
                                                                                                      value="<c:out value='${uniInfo.minorCode[i.index]}' />" />
                                                                                                  <button
                                                                                                      type="button"
                                                                                                      onClick="searchMajorPopup(this)">검색</button>
                                                                                              </span>
                                                                                          </span>
                                                                                      </td>
                                                                                  </tr>
                                                                          </c:when>
                                                                      </c:choose>

                                                                      <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                                                          <%-- 전체평점 표시 --%>
                                                                              <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                                                                  <c:if
                                                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                                      GPA_POINT\"')}">
                                                                                      <tr>
                                                                                          <c:choose>
                                                                                              <c:when
                                                                                                  test="${jobNoticeInfo.careerTypeCode=='B'}">
                                                                                                  <th
                                                                                                      scope="row">
                                                                                                      <label
                                                                                                          for="unigpaPoint_${i.index+1}">
                                                                                                          <LTag:message
                                                                                                              code="app.lbl.gpaPoint" />
                                                                                                      </label>
                                                                                                  </th>
                                                                                              </c:when>
                                                                                              <c:otherwise>
                                                                                                  <th
                                                                                                      scope="row">
                                                                                                      <label
                                                                                                          class="required"
                                                                                                          for="unigpaPoint_${i.index+1}"><span
                                                                                                              class="Lhide">(필수)</span>
                                                                                                          <LTag:message
                                                                                                              code="app.lbl.gpaPoint" />
                                                                                                      </label>
                                                                                                  </th>
                                                                                              </c:otherwise>
                                                                                          </c:choose>
                                                                                          <td
                                                                                              colspan="3">
                                                                                              <span
                                                                                                  class="set_selectInput">
                                                                                                  <input
                                                                                                      type="text"
                                                                                                      id="unigpaPoint_${i.index+1}"
                                                                                                      name="unigpaPoint_${i.index+1}"
                                                                                                      size="3"
                                                                                                      value="<c:out value='${uniInfo.gpaPoint[i.index]}' />"
                                                                                                      maxlength="5"
                                                                                                      onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                                                      style="ime-mode:disabled;"
                                                                                                      onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                                                  /
                                                                                                  <select
                                                                                                      title="전체평점"
                                                                                                      id="unigpaPointCode_${i.index+1}"
                                                                                                      name="unigpaPointCode_${i.index+1}"
                                                                                                      onChange="getText(this)">
                                                                                                      <option
                                                                                                          value="">
                                                                                                          <LTag:message
                                                                                                              code="app.lbl.select" />
                                                                                                      </option>
                                                                                                      <c:forEach
                                                                                                          items="${gpaTypeList.code}"
                                                                                                          varStatus="u">
                                                                                                          <option
                                                                                                              value="<c:out value='${gpaTypeList.code[u.index]}' />"
                                                                                                              <c:if
                                                                                                              test="${uniInfo.gpaPointCode[i.index] == gpaTypeList.code[u.index]}">
                                                                                                              selected
                                                                                  </c:if>>
                                                                                  <c:out
                                                                                      value='${gpaTypeList.value[u.index]}' />
                                                                                  </option>
              </c:forEach>
              </select>
              <input type="hidden" id="unigpaPointCodeVal_${i.index+1}"
                  name="unigpaPointCodeVal_${i.index+1}"
                  value="<c:out value='${uniInfo.gpaPointVal[i.index]}'/>" />
              </span>
              </td>
              </tr>
              </c:if>

              <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                  <%-- 전공평점 표시 --%>
                      <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                          <c:if test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                              MAJOR_GPA\"')}">
                              <tr>
                                  <c:choose>
                                      <c:when test="${jobNoticeInfo.careerTypeCode=='B'}">
                                          <th scope="row"><label for="unimajorGpa_${i.index+1}">
                                                  <LTag:message code="app.lbl.majorGpa" />
                                              </label></th>
                                      </c:when>
                                      <c:otherwise>
                                          <th scope="row"><label class="required"
                                                  for="unimajorGpa_${i.index+1}"><span
                                                      class="Lhide">(필수)</span>
                                                  <LTag:message code="app.lbl.majorGpa" />
                                              </label></th>
                                      </c:otherwise>
                                  </c:choose>
                                  <td colspan="3">
                                      <span class="set_selectInput">
                                          <input type="text" id="unimajorGpa_${i.index+1}"
                                              name="unimajorGpa_${i.index+1}" size="3"
                                              value="<c:out value='${uniInfo.majorGpa[i.index]}' />"
                                              maxlength="5"
                                              onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                              style="ime-mode:disabled;"
                                              onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                          /
                                          <select title="전공평점" id="unimajorGpaCode_${i.index+1}"
                                              name="unimajorGpaCode_${i.index+1}"
                                              onChange="getText(this)">
                                              <option value="">
                                                  <LTag:message code="app.lbl.select" />
                                              </option>
                                              <c:forEach items="${gpaTypeList.code}" varStatus="o">
                                                  <option
                                                      value="<c:out value='${gpaTypeList.code[o.index]}' />"
                                                      <c:if
                                                      test="${uniInfo.majorGpaCode[i.index] == gpaTypeList.code[o.index]}">
                                                      selected
                          </c:if>>
                          <c:out value='${gpaTypeList.value[o.index]}' />
                          </option>
                          </c:forEach>
                          </select>
                          <input type="hidden" id="unimajorGpaCodeVal_${i.index+1}"
                              name="unimajorGpaCodeVal_${i.index+1}"
                              value="<c:out value='${uniInfo.majorGpaPointVal[i.index]}'/>" />
                          </span>
                          </td>
                          </tr>
                          </c:if>

                          <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                              <%-- 전체이수학점 / 전공이수학점 표시 --%>
                                  <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                      <c:choose>
                                          <c:when
                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                              TOTAL_POINT\"') &&
                                              fn:contains(jobNoticeInfo.schoolInputSelected, '\"MAJOR_POINT\"'
                                              )}">

                                              <%-- 전체이수학점, 전공이수학점 구분 모두 입력받음 --%>

                                                  <tr>
                                                      <c:choose>
                                                          <c:when
                                                              test="${jobNoticeInfo.careerTypeCode=='B'}">
                                                              <th scope="row"><label
                                                                      for="unitotalPoint_${i.index+1}">
                                                                      <LTag:message
                                                                          code="app.lbl.totalPoint" />
                                                                  </label></th>
                                                          </c:when>
                                                          <c:otherwise>
                                                              <th scope="row"><label class="required"
                                                                      for="unitotalPoint_${i.index+1}">
                                                                      <LTag:message
                                                                          code="app.lbl.totalPoint" />
                                                                  </label></th>
                                                          </c:otherwise>
                                                      </c:choose>
                                                      <td>
                                                          <input type="text"
                                                              id="unitotalPoint_${i.index+1}"
                                                              name="unitotalPoint_${i.index+1}"
                                                              size="3"
                                                              value="<c:out value='${uniInfo.totalPoint[i.index]}' />"
                                                              maxlength="5"
                                                              onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                              style="ime-mode:disabled;"
                                                              onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                      </td>
                                                      <c:choose>
                                                          <c:when
                                                              test="${jobNoticeInfo.careerTypeCode=='B'}">
                                                              <th scope="row"><label
                                                                      for="unimajorPoint_${i.index+1}">
                                                                      <LTag:message
                                                                          code="app.lbl.majorPoint" />
                                                                  </label></th>
                                                          </c:when>
                                                          <c:otherwise>
                                                              <th scope="row"><label class="required"
                                                                      for="unimajorPoint_${i.index+1}">
                                                                      <LTag:message
                                                                          code="app.lbl.majorPoint" />
                                                                  </label></th>
                                                          </c:otherwise>
                                                      </c:choose>
                                                      <td>
                                                          <input type="text"
                                                              id="unimajorPoint_${i.index+1}"
                                                              name="unimajorPoint_${i.index+1}"
                                                              size="3"
                                                              value="<c:out value='${uniInfo.majorPoint[i.index]}' />"
                                                              maxlength="5"
                                                              onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                              style="ime-mode:disabled;"
                                                              onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                      </td>
                                                  </tr>

                                          </c:when>
                                          <c:when
                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                              TOTAL_POINT\"')}">

                                              <%-- 전체이수학점 만 입력받음 --%>

                                                  <tr>
                                                      <c:choose>
                                                          <c:when
                                                              test="${jobNoticeInfo.careerTypeCode=='B'}">
                                                              <th scope="row"><label
                                                                      for="unitotalPoint_${i.index+1}">
                                                                      <LTag:message
                                                                          code="app.lbl.totalPoint" />
                                                                  </label></th>
                                                          </c:when>
                                                          <c:otherwise>
                                                              <th scope="row"><label class="required"
                                                                      for="unitotalPoint_${i.index+1}">
                                                                      <LTag:message
                                                                          code="app.lbl.totalPoint" />
                                                                  </label></th>
                                                          </c:otherwise>
                                                      </c:choose>
                                                      <td colspan="3">
                                                          <input type="text"
                                                              id="unitotalPoint_${i.index+1}"
                                                              name="unitotalPoint_${i.index+1}"
                                                              size="3"
                                                              value="<c:out value='${uniInfo.totalPoint[i.index]}' />"
                                                              maxlength="5"
                                                              onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                              style="ime-mode:disabled;"
                                                              onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                      </td>
                                                  </tr>

                                          </c:when>
                                          <c:when
                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                              MAJOR_POINT\"')}">

                                              <%-- 전공이수학점 만 입력받음 --%>


                                                  <tr>
                                                      <c:choose>
                                                          <c:when
                                                              test="${jobNoticeInfo.careerTypeCode=='B'}">
                                                              <th scope="row"><label
                                                                      for="unimajorPoint_${i.index+1}">
                                                                      <LTag:message
                                                                          code="app.lbl.majorPoint" />
                                                                  </label></th>
                                                          </c:when>
                                                          <c:otherwise>
                                                              <th scope="row"><label class="required"
                                                                      for="unimajorPoint_${i.index+1}">
                                                                      <LTag:message
                                                                          code="app.lbl.majorPoint" />
                                                                  </label></th>
                                                          </c:otherwise>
                                                      </c:choose>
                                                      <td colspan="3">
                                                          <input type="text"
                                                              id="unimajorPoint_${i.index+1}"
                                                              name="unimajorPoint_${i.index+1}"
                                                              size="3"
                                                              value="<c:out value='${uniInfo.majorPoint[i.index]}' />"
                                                              maxlength="5"
                                                              onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                              style="ime-mode:disabled;"
                                                              onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                      </td>
                                                  </tr>
                                          </c:when>
                                      </c:choose>


                                      <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                          <%-- 복수전공이수학점 / 복수전공평점 표시 --%>
                                              <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                                  <c:choose>
                                                      <c:when
                                                          test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                          DOUBLE_POINT\"') &&
                                                          fn:contains(jobNoticeInfo.schoolInputSelected, '\"DOUBLE_GPA\"'
                                                          )}">

                                                          <%-- 복수전공이수학점, 복수전공평점 모두 입력받음 --%>

                                                              <tr class="double" <c:if
                                                                  test="${!empty uniInfo.minorType[i.index] && uniInfo.minorType[i.index] == 'A'}">
                                                                  style="display:none;" </c:if>>
                                                                  <th scope="row"><label
                                                                          for="unidoublePoint_${i.index+1}">
                                                                          <LTag:message
                                                                              code="app.lbl.doublePoint" />
                                                                      </label></th>
                                                                  <td>
                                                                      <input type="text"
                                                                          id="unidoublePoint_${i.index+1}"
                                                                          name="unidoublePoint_${i.index+1}"
                                                                          size="3"
                                                                          value="<c:out value='${uniInfo.doublePoint[i.index]}' />"
                                                                          maxlength="5"
                                                                          onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                          style="ime-mode:disabled;"
                                                                          onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                  </td>
                                                                  <th scope="row"><label
                                                                          for="unidoubleMajorGpa_${i.index+1}">
                                                                          <LTag:message
                                                                              code="app.lbl.doubleMajorGpa" />
                                                                      </label></th>
                                                                  <td>
                                                                      <span class="set_selectInput">
                                                                          <input type="text"
                                                                              id="unidoubleMajorGpa_${i.index+1}"
                                                                              name="unidoubleMajorGpa_${i.index+1}"
                                                                              size="3"
                                                                              value="<c:out value='${uniInfo.doubleMajorGpa[i.index]}' />"
                                                                              maxlength="5"
                                                                              onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                              style="ime-mode:disabled;"
                                                                              onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                          /
                                                                          <select title="학점 총점"
                                                                              id="unidoubleMajorGpaCode_${i.index+1}"
                                                                              name="unidoubleMajorGpaCode_${i.index+1}"
                                                                              onChange="getText(this)">
                                                                              <option value="">
                                                                                  <LTag:message
                                                                                      code="app.lbl.select" />
                                                                              </option>
                                                                              <c:forEach
                                                                                  items="${gpaTypeList.code}"
                                                                                  varStatus="u">
                                                                                  <option
                                                                                      value="<c:out value='${gpaTypeList.code[u.index]}' />"
                                                                                      <c:if
                                                                                      test="${uniInfo.doubleMajorGpaCode[i.index] == gpaTypeList.code[u.index]}">
                                                                                      selected </c:if>
                                                                                      >
                                                                                      <c:out
                                                                                          value='${gpaTypeList.value[u.index]}' />
                                                                                  </option>
                                                                              </c:forEach>
                                                                          </select>
                                                                          <input type="hidden"
                                                                              id="unidoubleMajorGpaCodeVal_${i.index+1}"
                                                                              name="unidoubleMajorGpaCodeVal_${i.index+1}"
                                                                              value="<c:out value='${uniInfo.doubleMajorGpaCode[i.index]}'/>" />
                                                                      </span>
                                                                  </td>

                                                              </tr>
                                                      </c:when>
                                                      <c:when
                                                          test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                          DOUBLE_POINT\"')}">

                                                          <%-- 복수전공이수학점 만 입력받음 --%>

                                                              <tr class="double" <c:if
                                                                  test="${!empty uniInfo.minorType[i.index] && uniInfo.minorType[i.index] == 'A'}">
                                                                  style="display:none;" </c:if>>
                                                                  <th scope="row"><label
                                                                          for="unidoublePoint_${i.index+1}">
                                                                          <LTag:message
                                                                              code="app.lbl.doublePoint" />
                                                                      </label></th>
                                                                  <td colspan="3">
                                                                      <input type="text"
                                                                          id="unidoublePoint_${i.index+1}"
                                                                          name="unidoublePoint_${i.index+1}"
                                                                          size="3"
                                                                          value="<c:out value='${uniInfo.doublePoint[i.index]}' />"
                                                                          maxlength="5"
                                                                          onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                          style="ime-mode:disabled;"
                                                                          onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                  </td>
                                                              </tr>
                                                      </c:when>
                                                      <c:when
                                                          test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                          DOUBLE_GPA\"')}">

                                                          <%-- 복수전공평점 만 입력받음 --%>

                                                              <tr class="double" <c:if
                                                                  test="${!empty uniInfo.minorType[i.index] && uniInfo.minorType[i.index] == 'A'}">
                                                                  style="display:none;" </c:if>>
                                                                  <th scope="row"><label
                                                                          for="unidoubleMajorGpa_${i.index+1}">
                                                                          <LTag:message
                                                                              code="app.lbl.doubleMajorGpa" />
                                                                      </label></th>
                                                                  <td colspan="3">
                                                                      <span class="set_selectInput">
                                                                          <input type="text"
                                                                              id="unidoubleMajorGpa_${i.index+1}"
                                                                              name="unidoubleMajorGpa_${i.index+1}"
                                                                              size="3"
                                                                              value="<c:out value='${uniInfo.doubleMajorGpa[i.index]}' />"
                                                                              maxlength="4"
                                                                              onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                              style="ime-mode:disabled;"
                                                                              onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                          /
                                                                          <select title="학점 총점"
                                                                              id="unidoubleMajorGpaCode_${i.index+1}"
                                                                              name="unidoubleMajorGpaCode_${i.index+1}"
                                                                              onChange="getText(this)">
                                                                              <option value="">
                                                                                  <LTag:message
                                                                                      code="app.lbl.select" />
                                                                              </option>
                                                                              <c:forEach
                                                                                  items="${gpaTypeList.code}"
                                                                                  varStatus="u">
                                                                                  <option
                                                                                      value="<c:out value='${gpaTypeList.code[u.index]}' />"
                                                                                      <c:if
                                                                                      test="${uniInfo.doubleMajorGpaCode[i.index] == gpaTypeList.code[u.index]}">
                                                                                      selected </c:if>
                                                                                      >
                                                                                      <c:out
                                                                                          value='${gpaTypeList.value[u.index]}' />
                                                                                  </option>
                                                                              </c:forEach>
                                                                          </select>
                                                                          <input type="hidden"
                                                                              id="unidoubleMajorGpaCodeVal_${i.index+1}"
                                                                              name="unidoubleMajorGpaCodeVal_${i.index+1}"
                                                                              value="<c:out value='${uniInfo.doubleMajorGpaCode[i.index]}'/>" />
                                                                      </span>
                                                                  </td>
                                                              </tr>
                                                      </c:when>
                                                  </c:choose>


                                                  <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                                      <%-- 부전공이수학점 / 부전공평점 표시 --%>
                                                          <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                                              <c:choose>
                                                                  <c:when
                                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                      MINOR_POINT\"') &&
                                                                      fn:contains(jobNoticeInfo.schoolInputSelected, '\"MINOR_GPA\"'
                                                                      )}">

                                                                      <%-- 부전공이수학점, 부전공평점 모두 입력받음 --%>

                                                                          <tr class="minor" <c:if
                                                                              test="${!empty uniInfo.minorType[i.index] && uniInfo.minorType[i.index] == 'B'}">
                                                                              style="display:none;"
                                                                              </c:if>>
                                                                              <th scope="row"><label
                                                                                      for="uniminorPoint_${i.index+1}">
                                                                                      <LTag:message
                                                                                          code="app.lbl.minorPoint" />
                                                                                  </label></th>
                                                                              <td>
                                                                                  <input type="text"
                                                                                      id="uniminorPoint_${i.index+1}"
                                                                                      name="uniminorPoint_${i.index+1}"
                                                                                      size="3"
                                                                                      value="<c:out value='${uniInfo.minorPoint[i.index]}' />"
                                                                                      maxlength="5"
                                                                                      onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                                      style="ime-mode:disabled;"
                                                                                      onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                              </td>
                                                                              <th scope="row"><label
                                                                                      for="uniminorGpa_${i.index+1}">
                                                                                      <LTag:message
                                                                                          code="app.lbl.minorGpa" />
                                                                                  </label></th>
                                                                              <td>
                                                                                  <span
                                                                                      class="set_selectInput">
                                                                                      <input
                                                                                          type="text"
                                                                                          id="uniminorGpa_${i.index+1}"
                                                                                          name="uniminorGpa_${i.index+1}"
                                                                                          size="3"
                                                                                          value="<c:out value='${uniInfo.minorGpa[i.index]}' />"
                                                                                          maxlength="5"
                                                                                          onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                                          style="ime-mode:disabled;"
                                                                                          onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                                      /
                                                                                      <select
                                                                                          title="학점 총점"
                                                                                          id="uniminorGpaCode_${i.index+1}"
                                                                                          name="uniminorGpaCode_${i.index+1}"
                                                                                          onChange="getText(this)">
                                                                                          <option
                                                                                              value="">
                                                                                              <LTag:message
                                                                                                  code="app.lbl.select" />
                                                                                          </option>
                                                                                          <c:forEach
                                                                                              items="${gpaTypeList.code}"
                                                                                              varStatus="o">
                                                                                              <option
                                                                                                  value="<c:out value='${gpaTypeList.code[o.index]}' />"
                                                                                                  <c:if
                                                                                                  test="${uniInfo.minorGpaCode[i.index] == gpaTypeList.code[o.index]}">
                                                                                                  selected
                                                                                                  </c:if>
                                                                                                  >
                                                                                                  <c:out
                                                                                                      value='${gpaTypeList.value[o.index]}' />
                                                                                              </option>
                                                                                          </c:forEach>
                                                                                      </select>
                                                                                      <input
                                                                                          type="hidden"
                                                                                          id="uniminorGpaPointVal_${i.index+1}"
                                                                                          name="uniminorGpaPointVal_${i.index+1}"
                                                                                          value="<c:out value='${uniInfo.minorGpaPointVal[i.index]}'/>" />
                                                                                  </span>
                                                                              </td>
                                                                          </tr>
                                                                  </c:when>
                                                                  <c:when
                                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                      MINOR_POINT\"')}">

                                                                      <%-- 부전공이수학점 만 입력받음 --%>

                                                                          <tr class="minor" <c:if
                                                                              test="${!empty uniInfo.minorType[i.index] && uniInfo.minorType[i.index] == 'B'}">
                                                                              style="display:none;"
                                                                              </c:if>>
                                                                              <th scope="row"><label
                                                                                      for="uniminorPoint_${i.index+1}">
                                                                                      <LTag:message
                                                                                          code="app.lbl.minorPoint" />
                                                                                  </label></th>
                                                                              <td colspan="3">
                                                                                  <input type="text"
                                                                                      id="uniminorPoint_${i.index+1}"
                                                                                      name="uniminorPoint_${i.index+1}"
                                                                                      size="3"
                                                                                      value="<c:out value='${uniInfo.minorPoint[i.index]}' />"
                                                                                      maxlength="5"
                                                                                      onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                                      style="ime-mode:disabled;"
                                                                                      onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                              </td>
                                                                          </tr>
                                                                  </c:when>
                                                                  <c:when
                                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                      MINOR_GPA\"')}">

                                                                      <%-- 부전공평점 만 입력받음 --%>

                                                                          <tr class="minor" <c:if
                                                                              test="${!empty uniInfo.minorType[i.index] && uniInfo.minorType[i.index] == 'B'}">
                                                                              style="display:none;"
                                                                              </c:if>>
                                                                              <th scope="row"><label
                                                                                      for="uniminorGpa_${i.index+1}">
                                                                                      <LTag:message
                                                                                          code="app.lbl.minorGpa" />
                                                                                  </label></th>
                                                                              <td colspan="3">
                                                                                  <span
                                                                                      class="set_selectInput">
                                                                                      <input
                                                                                          type="text"
                                                                                          id="uniminorGpa_${i.index+1}"
                                                                                          name="uniminorGpa_${i.index+1}"
                                                                                          size="3"
                                                                                          value="<c:out value='${uniInfo.minorGpa[i.index]}' />"
                                                                                          maxlength="4"
                                                                                          onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                                          style="ime-mode:disabled;"
                                                                                          onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                                      /
                                                                                      <select
                                                                                          title="학점 총점"
                                                                                          id="uniminorGpaCode_${i.index+1}"
                                                                                          name="uniminorGpaCode_${i.index+1}"
                                                                                          onChange="getText(this)">
                                                                                          <option
                                                                                              value="">
                                                                                              <LTag:message
                                                                                                  code="app.lbl.select" />
                                                                                          </option>
                                                                                          <c:forEach
                                                                                              items="${gpaTypeList.code}"
                                                                                              varStatus="o">
                                                                                              <option
                                                                                                  value="<c:out value='${gpaTypeList.code[o.index]}' />"
                                                                                                  <c:if
                                                                                                  test="${uniInfo.minorGpaCode[i.index] == gpaTypeList.code[o.index]}">
                                                                                                  selected
                                                                                                  </c:if>
                                                                                                  >
                                                                                                  <c:out
                                                                                                      value='${gpaTypeList.value[o.index]}' />
                                                                                              </option>
                                                                                          </c:forEach>
                                                                                      </select>
                                                                                      <input
                                                                                          type="hidden"
                                                                                          id="uniminorGpaPointVal_${i.index+1}"
                                                                                          name="uniminorGpaPointVal_${i.index+1}"
                                                                                          value="<c:out value='${uniInfo.minorGpaPointVal[i.index]}'/>" />
                                                                                  </span>
                                                                              </td>
                                                                          </tr>
                                                                  </c:when>
                                                              </c:choose>


                                                              <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                                                  <%-- 공학인증제 인증여부 입력 표시 --%>
                                                                      <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>


                                                                          <c:if
                                                                              test="${jobNoticeInfo.engineeringAccrFlag == 'N'}">
                                                                              <tr>
                                                                                  <th scope="row">
                                                                                      <label
                                                                                          class="required"><span
                                                                                              class="Lhide">(필수)</span>
                                                                                          <LTag:message
                                                                                              code="app.lbl.engineeringFlag" />
                                                                                      </label></th>
                                                                                  <td colspan="3">
                                                                                      <input
                                                                                          type="radio"
                                                                                          id="uniengineeringAccrFlag_yes_${i.index+1}"
                                                                                          name="uniengineeringAccrFlag_${i.index+1}"
                                                                                          value="Y"
                                                                                          <c:if
                                                                                          test="${uniInfo.engineeringAccrFlag[i.index] == 'Y'}">
                                                                                      checked="checked"
                                                                          </c:if> ><label
                                                                              for="engineeringAccrFlag_yes">Yes</label>
                                                                          <input type="radio"
                                                                              id="uniengineeringAccrFlag_no_${i.index+1}"
                                                                              name="uniengineeringAccrFlag_${i.index+1}"
                                                                              value="N" <c:if
                                                                              test="${uniInfo.engineeringAccrFlag[i.index] == 'N'}">
                                                                          checked="checked" </c:if>
                                                                          ><label
                                                                              for="engineeringAccrFlag_no">No</label>
                                                                          </td>
                                                                          </tr>
                                                                          </c:if>
                                                                          </tbody>
                                                                          </table>
          </div>
          </c:forEach>
          <div id="addUniDiv"></div>
          <div class="additionalTips">
              <%-- FPT - Static Analysis Handle - DELETE --%>
                  <p>
                      <LTag:message code="app.cont.additionalTip7" />
                  </p>
                  <p>
                      <LTag:message code="app.cont.additionalTip8" /><br />
                      <LTag:message code="app.cont.additionalTip18" />
                  </p>
                  <p>
                      <LTag:message code="app.cont.additionalTip14" />
                  </p>
                  <p>
                      <LTag:message code="app.cont.additionalTip15" />
                  </p>
                  <c:if test="${jobNoticeInfo.addSchoolFlag == 'N'}">
                      <p>전공이수학점은 전공필수, 전공선택 등 성적증명서상 전공으로 확인가능한 과목만 기입해 주시기 바랍니다.
                          <br />(예> 공학계열 전공자는 수학/물리/화학등 전공기초과목 제외)
                      </p>
                  </c:if>
          </div>
      </div>
  </div>
  </div>

  <!-- 대학교-석사 -->
  <div id="masterDiv" style="display:none">
      <div class="foldedInphone">
          <div class="dtFoldedInPhone btnmore">
              <div class="LblockPageSubtitle more">
                  <h3><span>
                          <LTag:message code="app.titl.master" />
                      </span> <span id="masterCount">(
                          <c:out value='${masterCount}' />)
                      </span></h3>
                  <h4>
                      <LTag:message code="app.cont.masterCont_1" />
                  </h4>
                  <div class="subtitleBtn">
                      <a href="#" class="btn_erase" onclick="fnEraseData('masterDiv');"><span
                              class="Lhide">
                              <LTag:message code="app.titl.master" /> 입력
                          </span>지우기</a>
                      <a href="#" id="masterAddBtn" class="btn_more"><span class="Lhide">
                              <LTag:message code="app.titl.master" />
                          </span>추가</a>
                  </div>
              </div>
          </div>
          <div class="ddFoldedInPhone">
              <c:forEach items="${masterInfo.jobNoticeId}" varStatus="i">
                  <c:if test="${i.index != 0}">
                      <div class="btn_deleteTable"><button type="button"
                              onClick="delDataInfo(this,'master');">다음 항목 삭제</button></div>
                  </c:if>
                  <div class="LblockDetailTable">
                      <%-- 비즈니스 로직에서 학교이름의 키를 파싱해서 숫자를 세므로 학교이름이 필수가 아닌 상황에서 로직을 맞춰주기위해 순번을 넣음. --%>
                          <input type="hidden" id="masterschoolSeqno_${i.index+1}"
                              name="masterschoolSeqno_${i.index+1}" value="${i.index+1}" />
                          <table class="applicationform rsp rsp-hori rsp-tablet">
                              <caption>
                                  <LTag:message code="app.titl.master" />
                              </caption>
                              <colgroup>
                                  <col style="width:18%;" />
                                  <col style="width:32%;" />
                                  <col style="width:18%;" />
                                  <col style="width:32%;" />
                              </colgroup>
                              <tbody>



                                  <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                      <%-- 학교명 / 소재지 표시 --%>
                                          <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                              <c:choose>
                                                  <c:when
                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                      SCHOOL_NAME\"') &&
                                                      fn:contains(jobNoticeInfo.schoolInputSelected, '\"LOCATION\"'
                                                      )}">

                                                      <%-- 학교명, 소재지 모두 입력받음 --%>

                                                          <tr>
                                                              <th scope="row"><label class="required"
                                                                      for="masterschoolName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.schoolName" />
                                                                  </label></th>
                                                              <td>
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="masterschoolName_${i.index+1}"
                                                                          name="masterschoolName_${i.index+1}"
                                                                          value="<c:out value='${masterInfo.schoolName[i.index]}' />"
                                                                          size="25"
                                                                          readonly="readonly" />
                                                                      <input type="hidden"
                                                                          id="masterschoolCode_${i.index+1}"
                                                                          name="masterschoolCode_${i.index+1}"
                                                                          value="<c:out value='${masterInfo.schoolCode[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolPopup(this,'U');">검색</button>
                                                                  </div>
                                                              </td>
                                                              <th scope="row"><label class="required"
                                                                      for="masterlocationName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.locationName" />
                                                                  </label></th>
                                                              <td>
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="masterlocationName_${i.index+1}"
                                                                          name="masterlocationName_${i.index+1}"
                                                                          value="<c:out value='${masterInfo.locationName[i.index]}' />"
                                                                          readonly="readonly"
                                                                          maxlength="300" />
                                                                      <input type="hidden"
                                                                          id="masteraddressSido_${i.index+1}"
                                                                          name="masteraddressSido_${i.index+1}"
                                                                          value="<c:out value='${masterInfo.addressSido[i.index]}' />" />
                                                                      <input type="hidden"
                                                                          id="masteraddressSigu_${i.index+1}"
                                                                          name="masteraddressSigu_${i.index+1}"
                                                                          value="<c:out value='${masterInfo.addressSigu[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolLocPopup(this);">검색</button>
                                                                  </div>
                                                              </td>
                                                          </tr>
                                                  </c:when>
                                                  <c:when
                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                      SCHOOL_NAME\"')}">

                                                      <%-- 학교명 만 입력받음 --%>

                                                          <tr>
                                                              <th scope="row"><label class="required"
                                                                      for="masterschoolName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.schoolName" />
                                                                  </label></th>
                                                              <td colspan="3">
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="masterschoolName_${i.index+1}"
                                                                          name="masterschoolName_${i.index+1}"
                                                                          value="<c:out value='${masterInfo.schoolName[i.index]}' />"
                                                                          size="25"
                                                                          readonly="readonly" />
                                                                      <input type="hidden"
                                                                          id="masterschoolCode_${i.index+1}"
                                                                          name="masterschoolCode_${i.index+1}"
                                                                          value="<c:out value='${masterInfo.schoolCode[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolPopup(this,'U');">검색</button>
                                                                  </div>
                                                              </td>
                                                          </tr>
                                                  </c:when>
                                                  <c:when
                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                      LOCATION\"')}">

                                                      <%-- 소재지 만 입력받음 --%>

                                                          <tr>
                                                              <th scope="row"><label class="required"
                                                                      for="masterlocationName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.locationName" />
                                                                  </label></th>
                                                              <td colspan="3">
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="masterlocationName_${i.index+1}"
                                                                          name="masterlocationName_${i.index+1}"
                                                                          value="<c:out value='${masterInfo.locationName[i.index]}' />"
                                                                          readonly="readonly"
                                                                          maxlength="300" />
                                                                      <input type="hidden"
                                                                          id="masteraddressSido_${i.index+1}"
                                                                          name="masteraddressSido_${i.index+1}"
                                                                          value="<c:out value='${masterInfo.addressSido[i.index]}' />" />
                                                                      <input type="hidden"
                                                                          id="masteraddressSigu_${i.index+1}"
                                                                          name="masteraddressSigu_${i.index+1}"
                                                                          value="<c:out value='${masterInfo.addressSigu[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolLocPopup(this);">검색</button>
                                                                  </div>
                                                              </td>
                                                          </tr>
                                                  </c:when>
                                              </c:choose>

                                              <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                                  <%-- 기간 / 졸업구분 표시 --%>
                                                      <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                                          <c:choose>
                                                              <c:when
                                                                  test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                  PERIOD\"') &&
                                                                  fn:contains(jobNoticeInfo.schoolInputSelected, '\"GRADUATION_STATUS\"'
                                                                  )}">

                                                                  <%-- 기간, 졸업구분 모두 입력받음 --%>

                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="masterstartDate_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.preriodDate" />
                                                                              </label></th>
                                                                          <td>
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="masterstartDate_${i.index+1}"
                                                                                  name="masterstartDate_${i.index+1}"
                                                                                  size="11"
                                                                                  value="<c:out value='${masterInfo.startDate[i.index]}' />"
                                                                                  maxlength="11"
                                                                                  readonly="readonly"
                                                                                  title="기간 시작일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="masterstartCal_${i.index+1}"
                                                                                  data-calendar="masterstartDate_${i.index+1}">달력</button>
                                                                              <label>~</label>
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="masterendDate_${i.index+1}"
                                                                                  name="masterendDate_${i.index+1}"
                                                                                  size="11"
                                                                                  maxlength="11"
                                                                                  value="<c:out value='${masterInfo.endDate[i.index]}' />"
                                                                                  readonly="readonly"
                                                                                  title="기간 종료일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="masterendCal_${i.index+1}"
                                                                                  data-calendar="masterendDate_${i.index+1}">달력</button>
                                                                          </td>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="mastergraduationStatusCode_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.graduationFlag" />
                                                                              </label></th>
                                                                          <td>
                                                                              <select
                                                                                  id="mastergraduationStatusCode_${i.index+1}"
                                                                                  name="mastergraduationStatusCode_${i.index+1}">
                                                                                  <option value="">
                                                                                      <LTag:message
                                                                                          code="app.lbl.select" />
                                                                                  </option>
                                                                                  <c:forEach
                                                                                      items="${graduationList.code}"
                                                                                      varStatus="l">
                                                                                      <option
                                                                                          value="<c:out value='${graduationList.code[l.index]}' />"
                                                                                          <c:if
                                                                                          test="${masterInfo.graduationStatusCode[i.index] == graduationList.code[l.index]}">
                                                                                          selected
                                                                                          </c:if>>
                                                                                          <c:out
                                                                                              value='${graduationList.value[l.index]}' />
                                                                                      </option>
                                                                                  </c:forEach>
                                                                              </select>
                                                                          </td>
                                                                      </tr>

                                                              </c:when>
                                                              <c:when
                                                                  test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                  PERIOD\"')}">

                                                                  <%-- 기간 만 입력받음 --%>


                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="masterstartDate_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.preriodDate" />
                                                                              </label></th>
                                                                          <td colspan="3">
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="masterstartDate_${i.index+1}"
                                                                                  name="masterstartDate_${i.index+1}"
                                                                                  size="11"
                                                                                  value="<c:out value='${masterInfo.startDate[i.index]}' />"
                                                                                  maxlength="11"
                                                                                  readonly="readonly"
                                                                                  title="기간 시작일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="masterstartCal_${i.index+1}"
                                                                                  data-calendar="masterstartDate_${i.index+1}">달력</button>
                                                                              <label>~</label>
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="masterendDate_${i.index+1}"
                                                                                  name="masterendDate_${i.index+1}"
                                                                                  size="11"
                                                                                  maxlength="11"
                                                                                  value="<c:out value='${masterInfo.endDate[i.index]}' />"
                                                                                  readonly="readonly"
                                                                                  title="기간 종료일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="masterendCal_${i.index+1}"
                                                                                  data-calendar="masterendDate_${i.index+1}">달력</button>
                                                                          </td>
                                                                      </tr>

                                                              </c:when>
                                                              <c:when
                                                                  test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                  GRADUATION_STATUS\"')}">

                                                                  <%-- 졸업구분 만 입력받음 --%>


                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="mastergraduationStatusCode_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.graduationFlag" />
                                                                              </label></th>
                                                                          <td colspan="3">
                                                                              <select
                                                                                  id="mastergraduationStatusCode_${i.index+1}"
                                                                                  name="mastergraduationStatusCode_${i.index+1}">
                                                                                  <option value="">
                                                                                      <LTag:message
                                                                                          code="app.lbl.select" />
                                                                                  </option>
                                                                                  <c:forEach
                                                                                      items="${graduationList.code}"
                                                                                      varStatus="l">
                                                                                      <option
                                                                                          value="<c:out value='${graduationList.code[l.index]}' />"
                                                                                          <c:if
                                                                                          test="${masterInfo.graduationStatusCode[i.index] == graduationList.code[l.index]}">
                                                                                          selected
                                                                                          </c:if>>
                                                                                          <c:out
                                                                                              value='${graduationList.value[l.index]}' />
                                                                                      </option>
                                                                                  </c:forEach>
                                                                              </select>
                                                                          </td>
                                                                      </tr>

                                                              </c:when>
                                                          </c:choose>

                                                          <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                                              <%-- 전공명 / 전체평점 표시 --%>
                                                                  <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                                                      <c:choose>
                                                                          <c:when
                                                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                              MAJOR_NAME\"') &&
                                                                              fn:contains(jobNoticeInfo.schoolInputSelected, '\"GPA_POINT\"'
                                                                              )}">

                                                                              <%-- 전공명, 전체평점 모두 입력받음
                                                                                  --%>

                                                                                  <tr>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="mastermajorName_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.majorName" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td>
                                                                                          <div
                                                                                              class="input_search">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="mastermajorName_${i.index+1}"
                                                                                                  name="mastermajorName_${i.index+1}"
                                                                                                  value="<c:out value='${masterInfo.majorName[i.index]}' />"
                                                                                                  size="25"
                                                                                                  readonly="readonly" />
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="mastermajorCode_${i.index+1}"
                                                                                                  name="mastermajorCode_${i.index+1}"
                                                                                                  value="<c:out value='${masterInfo.majorCode[i.index]}' />" />
                                                                                              <button
                                                                                                  type="button"
                                                                                                  onClick="searchMajorPopup(this)">검색</button>
                                                                                          </div>
                                                                                      </td>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="mastergpaPoint_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.gpaPoint" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td>
                                                                                          <span
                                                                                              class="set_selectInput">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="mastergpaPoint_${i.index+1}"
                                                                                                  name="mastergpaPoint_${i.index+1}"
                                                                                                  size="3"
                                                                                                  value="<c:out value='${masterInfo.gpaPoint[i.index]}' />"
                                                                                                  maxlength="5"
                                                                                                  onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                                                  style="ime-mode:disabled;"
                                                                                                  onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                                              /
                                                                                              <select
                                                                                                  title="학점 총점"
                                                                                                  id="mastergpaPointCode_${i.index+1}"
                                                                                                  name="mastergpaPointCode_${i.index+1}"
                                                                                                  onChange="getText(this)">
                                                                                                  <option
                                                                                                      value="">
                                                                                                      <LTag:message
                                                                                                          code="app.lbl.select" />
                                                                                                  </option>
                                                                                                  <c:forEach
                                                                                                      items="${gpaTypeList.code}"
                                                                                                      varStatus="l">
                                                                                                      <option
                                                                                                          value="<c:out value='${gpaTypeList.code[l.index]}' />"
                                                                                                          <c:if
                                                                                                          test="${masterInfo.gpaPointCode[i.index] == gpaTypeList.code[l.index]}">
                                                                                                          selected
                                                                                                          </c:if>
                                                                                                          >
                                                                                                          <c:out
                                                                                                              value='${gpaTypeList.value[l.index]}' />
                                                                                                      </option>
                                                                                                  </c:forEach>
                                                                                              </select>
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="mastergpaPointCodeVal_${i.index+1}"
                                                                                                  name="mastergpaPointCodeVal_${i.index+1}"
                                                                                                  value="<c:out value='${masterInfo.gpaPointVal[i.index]}'/>" />
                                                                                          </span>
                                                                                      </td>
                                                                                  </tr>

                                                                          </c:when>
                                                                          <c:when
                                                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                              MAJOR_NAME\"')}">

                                                                              <%-- 전공명 만 입력받음 --%>

                                                                                  <tr>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="mastermajorName_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.majorName" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td colspan="3">
                                                                                          <div
                                                                                              class="input_search">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="mastermajorName_${i.index+1}"
                                                                                                  name="mastermajorName_${i.index+1}"
                                                                                                  value="<c:out value='${masterInfo.majorName[i.index]}' />"
                                                                                                  size="25"
                                                                                                  readonly="readonly" />
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="mastermajorCode_${i.index+1}"
                                                                                                  name="mastermajorCode_${i.index+1}"
                                                                                                  value="<c:out value='${masterInfo.majorCode[i.index]}' />" />
                                                                                              <button
                                                                                                  type="button"
                                                                                                  onClick="searchMajorPopup(this)">검색</button>
                                                                                          </div>
                                                                                      </td>
                                                                                  </tr>

                                                                          </c:when>
                                                                          <c:when
                                                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                              GPA_POINT\"')}">

                                                                              <%-- 전체평점 만 입력받음 --%>

                                                                                  <tr>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="mastergpaPoint_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.gpaPoint" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td colspan="3">
                                                                                          <span
                                                                                              class="set_selectInput">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="mastergpaPoint_${i.index+1}"
                                                                                                  name="mastergpaPoint_${i.index+1}"
                                                                                                  size="3"
                                                                                                  value="<c:out value='${masterInfo.gpaPoint[i.index]}' />"
                                                                                                  maxlength="5"
                                                                                                  onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                                                  style="ime-mode:disabled;"
                                                                                                  onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                                              /
                                                                                              <select
                                                                                                  title="학점 총점"
                                                                                                  id="mastergpaPointCode_${i.index+1}"
                                                                                                  name="mastergpaPointCode_${i.index+1}"
                                                                                                  onChange="getText(this)">
                                                                                                  <option
                                                                                                      value="">
                                                                                                      <LTag:message
                                                                                                          code="app.lbl.select" />
                                                                                                  </option>
                                                                                                  <c:forEach
                                                                                                      items="${gpaTypeList.code}"
                                                                                                      varStatus="l">
                                                                                                      <option
                                                                                                          value="<c:out value='${gpaTypeList.code[l.index]}' />"
                                                                                                          <c:if
                                                                                                          test="${masterInfo.gpaPointCode[i.index] == gpaTypeList.code[l.index]}">
                                                                                                          selected
                                                                                                          </c:if>
                                                                                                          >
                                                                                                          <c:out
                                                                                                              value='${gpaTypeList.value[l.index]}' />
                                                                                                      </option>
                                                                                                  </c:forEach>
                                                                                              </select>
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="mastergpaPointCodeVal_${i.index+1}"
                                                                                                  name="mastergpaPointCodeVal_${i.index+1}"
                                                                                                  value="<c:out value='${masterInfo.gpaPointVal[i.index]}'/>" />
                                                                                          </span>
                                                                                      </td>
                                                                                  </tr>

                                                                          </c:when>
                                                                      </c:choose>


                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="masteracademicAdvisorName_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.msprofessor" />
                                                                              </label></th>
                                                                          <td>
                                                                              <input type="text"
                                                                                  id="masteracademicAdvisorName_${i.index+1}"
                                                                                  name="masteracademicAdvisorName_${i.index+1}"
                                                                                  value="<c:out value='${masterInfo.academicAdvisorName[i.index]}' />"
                                                                                  maxlength="300" />
                                                                          </td>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for=masterlabName_${i.index+1}><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.mastersUnivLab" />
                                                                              </label></th>
                                                                          <td>
                                                                              <input type="text"
                                                                                  class="displayblock"
                                                                                  style="min-width:97%;"
                                                                                  id="masterlabName_${i.index+1}"
                                                                                  name="masterlabName_${i.index+1}"
                                                                                  value="<c:out value='${masterInfo.labName[i.index]}' />"
                                                                                  maxlength="100" />
                                                                          </td>
                                                                      </tr>
                                                                      <tr>
                                                                          <th scope="row" rowspan="2">
                                                                              <label class="required"
                                                                                  for="mastertitleOfStudy_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.msfield" />
                                                                              </label></th>
                                                                          <td colspan="3">
                                                                              <span
                                                                                  class="LsubInstruction">
                                                                                  <LTag:message
                                                                                      code="app.cont.additionalTip13" />
                                                                              </span>
                                                                              <input type="text"
                                                                                  class="displayblock"
                                                                                  id="mastertitleOfStudy_${i.index+1}"
                                                                                  name="mastertitleOfStudy_${i.index+1}"
                                                                                  size=30
                                                                                  title="<LTag:message code="
                                                                                  app.lbl.msfield" />
                                                                              제목" value="
                                                                              <c:out
                                                                                  value='${masterInfo.titleOfStudy[i.index]}' />
                                                                              " maxlength="300" />
                                                                          </td>
                                                                      </tr>
                                                                      <tr>
                                                                          <td colspan="3">
                                                                              <div class="td_sub">
                                                                                  <LTag:message
                                                                                      code="app.lbl.charLength" />
                                                                                  <span
                                                                                      id="masterChar_${i.index+1}">
                                                                                      0</span>/ 1500
                                                                                  <LTag:message
                                                                                      code="app.lbl.char" />
                                                                              </div>
                                                                              <textarea
                                                                                  title="자신의 주 연구 분야를 자유롭게 기술하세요. (어필할 수 있는 논문/특허/프로젝트 등 포함)"
                                                                                  id="mastercontent_${i.index+1}"
                                                                                  name="mastercontent_${i.index+1}"
                                                                                  class="LtextArea"
                                                                                  placeholder="자신의 주 연구 분야를 자유롭게 기술하세요. (어필할 수 있는 논문/특허/프로젝트 등 포함)"><c:out value='${masterInfo.content[i.index]}' /></textarea>
                                                                          </td>
                                                                      </tr>
                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.mastersThesis" />
                                                                              </label></th>
                                                                          <td colspan="3"
                                                                              class="td_file">
                                                                              <div
                                                                                  class="set_selectInput hiddenInPhone hiddenInTablet">
                                                                                  <c:if
                                                                                      test="${i.index == 0}">
                                                                                      <input
                                                                                          type="hidden"
                                                                                          id="deleteFileSeqNo"
                                                                                          name="deleteFileSeqNo" />
                                                                                  </c:if>
                                                                                  <input type="hidden"
                                                                                      id="masterattachFileId_${i.index+1}"
                                                                                      name="masterattachFileId_${i.index+1}"
                                                                                      value="<c:out value='${masterInfo.attachFileId[i.index]}'/>" />
                                                                                  <button
                                                                                      type="button"
                                                                                      class="btn_file"
                                                                                      onclick="addItem('#mastersThesis_${i.index+1}','master_${i.index+1}');"><span>
                                                                                          <LTag:message
                                                                                              code="app.lbl.addAttachFile" />
                                                                                      </span></button>
                                                                                  <ul id="mastersThesis_${i.index+1}"
                                                                                      class="LblockItemList Lfile">
                                                                                      <c:forEach
                                                                                          items="${schoolFileList.attachFileId}"
                                                                                          varStatus="j">
                                                                                          <c:if
                                                                                              test="${schoolFileList.attachFileId[j.index] == masterInfo.attachFileId[i.index]}">
                                                                                              <li
                                                                                                  style="">
                                                                                                  <p><a href="javascript:;"
                                                                                                          onClick="fileDownload('${schoolFileList.dlFileName[j.index]}','${schoolFileList.attachFileId[j.index]}')">
                                                                                                          <c:out
                                                                                                              value='${schoolFileList.dlFileName[j.index]}' />
                                                                                                      </a><button
                                                                                                          type='button'
                                                                                                          onclick='deleteItem(this);'>삭제</button>
                                                                                                  </p>
                                                                                                  <input
                                                                                                      type="hidden"
                                                                                                      id="fileSeqNo"
                                                                                                      name="fileSeqNo"
                                                                                                      value="<c:out value='${schoolFileList.fileSeqNo[j.index]}'/>" />
                                                                                              </li>
                                                                                          </c:if>
                                                                                      </c:forEach>
                                                                                  </ul>
                                                                              </div>
                                                                              <div
                                                                                  class="Lexplanation displayInPhone">
                                                                                  <p>
                                                                                      <LTag:message
                                                                                          code="com.inf.029" />
                                                                                  </p>
                                                                                  <ul
                                                                                      class="LblockItemList Lfile">
                                                                                      <c:forEach
                                                                                          items="${schoolFileList.attachFileId}"
                                                                                          varStatus="j">
                                                                                          <c:if
                                                                                              test="${schoolFileList.attachFileId[j.index] == masterInfo.attachFileId[i.index]}">
                                                                                              <li
                                                                                                  style="">
                                                                                                  <c:out
                                                                                                      value='${schoolFileList.dlFileName[j.index]}' />
                                                                                              </li>
                                                                                          </c:if>
                                                                                      </c:forEach>
                                                                                  </ul>
                                                                              </div>
                                                                          </td>

                                                                      </tr>

                              </tbody>
                          </table>
                  </div>
              </c:forEach>
              <div id="addMasterDiv"></div>
              <div class="additionalTips">
                  <p>
                      <LTag:message code="app.cont.additionalTip9" />
                  </p>
                  <p>
                      <LTag:message code="app.cont.additionalTip11" />
                  </p>
              </div>
          </div>
      </div>
  </div>

  <!-- 대학교-박사 -->
  <div id="doctorDiv" style="display:none">
      <div class="foldedInphone">
          <div class="dtFoldedInPhone btnmore">
              <div class="LblockPageSubtitle more">
                  <h3><span>
                          <LTag:message code="app.titl.doctor" />
                      </span> <span id="doctorCount">(
                          <c:out value='${doctorCount}' />)
                      </span></h3>
                  <h4>
                      <LTag:message code="app.cont.doctorCont_1" />
                  </h4>
                  <div class="subtitleBtn">
                      <a href="#" class="btn_erase" onclick="fnEraseData('doctorDiv');"><span
                              class="Lhide">
                              <LTag:message code="app.titl.doctor" /> 입력
                          </span>지우기</a>
                      <a href="#" id="doctorAddBtn" class="btn_more"><span class="Lhide">
                              <LTag:message code="app.titl.doctor" />
                          </span>추가</a>
                  </div>
              </div>
          </div>
          <div class="ddFoldedInPhone">
              <c:forEach items="${doctorInfo.jobNoticeId}" varStatus="i">
                  <c:if test="${i.index != 0}">
                      <div class="btn_deleteTable"><button type="button"
                              onClick="delDataInfo(this,'doctor');">다음 항목 삭제</button></div>
                  </c:if>
                  <div class="LblockDetailTable">
                      <%-- 비즈니스 로직에서 학교이름의 키를 파싱해서 숫자를 세므로 학교이름이 필수가 아닌 상황에서 로직을 맞춰주기위해 순번을 넣음. --%>
                          <input type="hidden" id="doctorschoolSeqno_${i.index+1}"
                              name="doctorschoolSeqno_${i.index+1}" value="${i.index+1}" />
                          <table class="applicationform rsp rsp-hori rsp-tablet">
                              <caption>
                                  <LTag:message code="app.titl.doctor" />
                              </caption>
                              <colgroup>
                                  <col style="width:18%;" />
                                  <col style="width:32%;" />
                                  <col style="width:18%;" />
                                  <col style="width:32%;" />
                              </colgroup>
                              <tbody>
                                  <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                      <%-- 학교명 / 소재지 표시 --%>
                                          <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                              <c:choose>
                                                  <c:when
                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                      SCHOOL_NAME\"') &&
                                                      fn:contains(jobNoticeInfo.schoolInputSelected, '\"LOCATION\"'
                                                      )}">

                                                      <%-- 학교명, 소재지 모두 입력받음 --%>

                                                          <tr>
                                                              <th scope="row"><label class="required"
                                                                      for="doctorschoolName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.schoolName" />
                                                                  </label></th>
                                                              <td>
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="doctorschoolName_${i.index+1}"
                                                                          name="doctorschoolName_${i.index+1}"
                                                                          value="<c:out value='${doctorInfo.schoolName[i.index]}' />"
                                                                          size="25"
                                                                          readonly="readonly" />
                                                                      <input type="hidden"
                                                                          id="doctorschoolCode_${i.index+1}"
                                                                          name="doctorschoolCode_${i.index+1}"
                                                                          value="<c:out value='${doctorInfo.schoolCode[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolPopup(this,'U');">검색</button>
                                                                  </div>
                                                              </td>
                                                              <th scope="row"><label class="required"
                                                                      for="doctorlocationName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.locationName" />
                                                                  </label></th>
                                                              <td>
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="doctorlocationName_${i.index+1}"
                                                                          name="doctorlocationName_${i.index+1}"
                                                                          value="<c:out value='${doctorInfo.locationName[i.index]}' />"
                                                                          readonly="readonly"
                                                                          maxlength="300" />
                                                                      <input type="hidden"
                                                                          id="doctoraddressSido_${i.index+1}"
                                                                          name="doctoraddressSido_${i.index+1}"
                                                                          value="<c:out value='${doctorInfo.addressSido[i.index]}' />" />
                                                                      <input type="hidden"
                                                                          id="doctoraddressSigu_${i.index+1}"
                                                                          name="doctoraddressSigu_${i.index+1}"
                                                                          value="<c:out value='${doctorInfo.addressSigu[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolLocPopup(this);">검색</button>
                                                                  </div>

                                                              </td>
                                                          </tr>

                                                  </c:when>
                                                  <c:when
                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                      SCHOOL_NAME\"')}">

                                                      <%-- 학교명 만 입력받음 --%>

                                                          <tr>
                                                              <th scope="row"><label class="required"
                                                                      for="doctorschoolName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.schoolName" />
                                                                  </label></th>
                                                              <td colspan="3">
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="doctorschoolName_${i.index+1}"
                                                                          name="doctorschoolName_${i.index+1}"
                                                                          value="<c:out value='${doctorInfo.schoolName[i.index]}' />"
                                                                          size="25"
                                                                          readonly="readonly" />
                                                                      <input type="hidden"
                                                                          id="doctorschoolCode_${i.index+1}"
                                                                          name="doctorschoolCode_${i.index+1}"
                                                                          value="<c:out value='${doctorInfo.schoolCode[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolPopup(this,'U');">검색</button>
                                                                  </div>
                                                              </td>
                                                          </tr>

                                                  </c:when>
                                                  <c:when
                                                      test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                      LOCATION\"')}">

                                                      <%-- 소재지 만 입력받음 --%>

                                                          <tr>
                                                              <th scope="row"><label class="required"
                                                                      for="doctorlocationName_${i.index+1}"><span
                                                                          class="Lhide">(필수)</span>
                                                                      <LTag:message
                                                                          code="app.lbl.locationName" />
                                                                  </label></th>
                                                              <td colspan="3">
                                                                  <div class="input_search">
                                                                      <input type="text"
                                                                          id="doctorlocationName_${i.index+1}"
                                                                          name="doctorlocationName_${i.index+1}"
                                                                          value="<c:out value='${doctorInfo.locationName[i.index]}' />"
                                                                          readonly="readonly"
                                                                          maxlength="300" />
                                                                      <input type="hidden"
                                                                          id="doctoraddressSido_${i.index+1}"
                                                                          name="doctoraddressSido_${i.index+1}"
                                                                          value="<c:out value='${doctorInfo.addressSido[i.index]}' />" />
                                                                      <input type="hidden"
                                                                          id="doctoraddressSigu_${i.index+1}"
                                                                          name="doctoraddressSigu_${i.index+1}"
                                                                          value="<c:out value='${doctorInfo.addressSigu[i.index]}' />" />
                                                                      <button type="button"
                                                                          onclick="searchSchoolLocPopup(this);">검색</button>
                                                                  </div>

                                                              </td>
                                                          </tr>

                                                  </c:when>
                                              </c:choose>

                                              <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                                  <%-- 기간 / 졸업구분 표시 --%>
                                                      <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                                          <c:choose>
                                                              <c:when
                                                                  test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                  PERIOD\"') &&
                                                                  fn:contains(jobNoticeInfo.schoolInputSelected, '\"GRADUATION_STATUS\"'
                                                                  )}">

                                                                  <%-- 기간, 졸업구분 모두 입력받음 --%>

                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="doctorstartDate_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.preriodDate" />
                                                                              </label></th>
                                                                          <td>
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="doctorstartDate_${i.index+1}"
                                                                                  name="doctorstartDate_${i.index+1}"
                                                                                  size="11"
                                                                                  value="<c:out value='${doctorInfo.startDate[i.index]}' />"
                                                                                  maxlength="11"
                                                                                  readonly="readonly"
                                                                                  title="기간 시작일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="doctorstartCal_${i.index+1}"
                                                                                  data-calendar="doctorstartDate_${i.index+1}">달력</button>
                                                                              <label>~</label>
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="doctorendDate_${i.index+1}"
                                                                                  name="doctorendDate_${i.index+1}"
                                                                                  size="11"
                                                                                  maxlength="11"
                                                                                  value="<c:out value='${doctorInfo.endDate[i.index]}' />"
                                                                                  readonly="readonly"
                                                                                  title="기간 종료일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="doctorendCal_${i.index+1}"
                                                                                  data-calendar="doctorendDate_${i.index+1}">달력</button>
                                                                          </td>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="doctorgraduationStatusCode_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.graduationFlag" />
                                                                              </label></th>
                                                                          <td>
                                                                              <select
                                                                                  id="doctorgraduationStatusCode_${i.index+1}"
                                                                                  name="doctorgraduationStatusCode_${i.index+1}">
                                                                                  <option value="">
                                                                                      <LTag:message
                                                                                          code="app.lbl.select" />
                                                                                  </option>
                                                                                  <c:forEach
                                                                                      items="${graduationList.code}"
                                                                                      varStatus="l">
                                                                                      <option
                                                                                          value="<c:out value='${graduationList.code[l.index]}' />"
                                                                                          <c:if
                                                                                          test="${doctorInfo.graduationStatusCode[i.index] == graduationList.code[l.index]}">
                                                                                          selected
                                                                                          </c:if>>
                                                                                          <c:out
                                                                                              value='${graduationList.value[l.index]}' />
                                                                                      </option>
                                                                                  </c:forEach>
                                                                              </select>
                                                                          </td>
                                                                      </tr>

                                                              </c:when>
                                                              <c:when
                                                                  test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                  PERIOD\"')}">

                                                                  <%-- 기간 만 입력받음 --%>


                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="doctorstartDate_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.preriodDate" />
                                                                              </label></th>
                                                                          <td colspan="3">
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="doctorstartDate_${i.index+1}"
                                                                                  name="doctorstartDate_${i.index+1}"
                                                                                  size="11"
                                                                                  value="<c:out value='${doctorInfo.startDate[i.index]}' />"
                                                                                  maxlength="11"
                                                                                  readonly="readonly"
                                                                                  title="기간 시작일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="doctorstartCal_${i.index+1}"
                                                                                  data-calendar="doctorstartDate_${i.index+1}">달력</button>
                                                                              <label>~</label>
                                                                              <input type="text"
                                                                                  class="Ltext"
                                                                                  id="doctorendDate_${i.index+1}"
                                                                                  name="doctorendDate_${i.index+1}"
                                                                                  size="11"
                                                                                  maxlength="11"
                                                                                  value="<c:out value='${doctorInfo.endDate[i.index]}' />"
                                                                                  readonly="readonly"
                                                                                  title="기간 종료일" />
                                                                              <button type="button"
                                                                                  class="LiconCalendar"
                                                                                  id="doctorendCal_${i.index+1}"
                                                                                  data-calendar="doctorendDate_${i.index+1}">달력</button>
                                                                          </td>
                                                                      </tr>

                                                              </c:when>
                                                              <c:when
                                                                  test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                  GRADUATION_STATUS\"')}">

                                                                  <%-- 졸업구분 만 입력받음 --%>

                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="doctorgraduationStatusCode_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.graduationFlag" />
                                                                              </label></th>
                                                                          <td colspan="3">
                                                                              <select
                                                                                  id="doctorgraduationStatusCode_${i.index+1}"
                                                                                  name="doctorgraduationStatusCode_${i.index+1}">
                                                                                  <option value="">
                                                                                      <LTag:message
                                                                                          code="app.lbl.select" />
                                                                                  </option>
                                                                                  <c:forEach
                                                                                      items="${graduationList.code}"
                                                                                      varStatus="l">
                                                                                      <option
                                                                                          value="<c:out value='${graduationList.code[l.index]}' />"
                                                                                          <c:if
                                                                                          test="${doctorInfo.graduationStatusCode[i.index] == graduationList.code[l.index]}">
                                                                                          selected
                                                                                          </c:if>>
                                                                                          <c:out
                                                                                              value='${graduationList.value[l.index]}' />
                                                                                      </option>
                                                                                  </c:forEach>
                                                                              </select>
                                                                          </td>
                                                                      </tr>

                                                              </c:when>
                                                          </c:choose>

                                                          <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
                                                              <%-- 전공명 / 전체평점 표시 --%>
                                                                  <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                                                      <c:choose>
                                                                          <c:when
                                                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                              MAJOR_NAME\"') &&
                                                                              fn:contains(jobNoticeInfo.schoolInputSelected, '\"GPA_POINT\"'
                                                                              )}">

                                                                              <%-- 전공명, 전체평점 모두 입력받음
                                                                                  --%>


                                                                                  <tr>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="doctormajorName_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.majorName" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td>
                                                                                          <div
                                                                                              class="input_search">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="doctormajorName_${i.index+1}"
                                                                                                  name="doctormajorName_${i.index+1}"
                                                                                                  value="<c:out value='${doctorInfo.majorName[i.index]}' />"
                                                                                                  size="25"
                                                                                                  readonly="readonly" />
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="doctormajorCode_${i.index+1}"
                                                                                                  name="doctormajorCode_${i.index+1}"
                                                                                                  value="<c:out value='${doctorInfo.majorCode[i.index]}' />" />
                                                                                              <button
                                                                                                  type="button"
                                                                                                  onClick="searchMajorPopup(this)">검색</button>
                                                                                          </div>
                                                                                      </td>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="doctorgpaPoint_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.gpaPoint" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td>
                                                                                          <span
                                                                                              class="set_selectInput">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="doctorgpaPoint_${i.index+1}"
                                                                                                  name="doctorgpaPoint_${i.index+1}"
                                                                                                  size="3"
                                                                                                  value="<c:out value='${doctorInfo.gpaPoint[i.index]}' />"
                                                                                                  maxlength="5"
                                                                                                  onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                                                  style="ime-mode:disabled;"
                                                                                                  onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                                              /
                                                                                              <select
                                                                                                  title="학점 총점"
                                                                                                  id="doctorgpaPointCode_${i.index+1}"
                                                                                                  name="doctorgpaPointCode_${i.index+1}"
                                                                                                  onChange="getText(this)">
                                                                                                  <option
                                                                                                      value="">
                                                                                                      <LTag:message
                                                                                                          code="app.lbl.select" />
                                                                                                  </option>
                                                                                                  <c:forEach
                                                                                                      items="${gpaTypeList.code}"
                                                                                                      varStatus="l">
                                                                                                      <option
                                                                                                          value="<c:out value='${gpaTypeList.code[l.index]}' />"
                                                                                                          <c:if
                                                                                                          test="${doctorInfo.gpaPointCode[i.index] == gpaTypeList.code[l.index]}">
                                                                                                          selected
                                                                                                          </c:if>
                                                                                                          >
                                                                                                          <c:out
                                                                                                              value='${gpaTypeList.value[l.index]}' />
                                                                                                      </option>
                                                                                                  </c:forEach>
                                                                                              </select>
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="doctorgpaPointCodeVal_${i.index+1}"
                                                                                                  name="doctorgpaPointCodeVal_${i.index+1}"
                                                                                                  value="<c:out value='${doctorInfo.gpaPointVal[i.index]}'/>" />
                                                                                          </span>
                                                                                      </td>
                                                                                  </tr>


                                                                          </c:when>
                                                                          <c:when
                                                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                              MAJOR_NAME\"')}">

                                                                              <%-- 전공명 만 입력받음 --%>


                                                                                  <tr>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="doctormajorName_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.majorName" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td colspan="3">
                                                                                          <div
                                                                                              class="input_search">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="doctormajorName_${i.index+1}"
                                                                                                  name="doctormajorName_${i.index+1}"
                                                                                                  value="<c:out value='${doctorInfo.majorName[i.index]}' />"
                                                                                                  size="25"
                                                                                                  readonly="readonly" />
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="doctormajorCode_${i.index+1}"
                                                                                                  name="doctormajorCode_${i.index+1}"
                                                                                                  value="<c:out value='${doctorInfo.majorCode[i.index]}' />" />
                                                                                              <button
                                                                                                  type="button"
                                                                                                  onClick="searchMajorPopup(this)">검색</button>
                                                                                          </div>
                                                                                      </td>
                                                                                  </tr>


                                                                          </c:when>
                                                                          <c:when
                                                                              test="${fn:contains(jobNoticeInfo.schoolInputSelected, '\"
                                                                              GPA_POINT\"')}">

                                                                              <%-- 전체평점 만 입력받음 --%>

                                                                                  <tr>
                                                                                      <th scope="row">
                                                                                          <label
                                                                                              class="required"
                                                                                              for="doctorgpaPoint_${i.index+1}"><span
                                                                                                  class="Lhide">(필수)</span>
                                                                                              <LTag:message
                                                                                                  code="app.lbl.gpaPoint" />
                                                                                          </label>
                                                                                      </th>
                                                                                      <td colspan="3">
                                                                                          <span
                                                                                              class="set_selectInput">
                                                                                              <input
                                                                                                  type="text"
                                                                                                  id="doctorgpaPoint_${i.index+1}"
                                                                                                  name="doctorgpaPoint_${i.index+1}"
                                                                                                  size="3"
                                                                                                  value="<c:out value='${doctorInfo.gpaPoint[i.index]}' />"
                                                                                                  maxlength="5"
                                                                                                  onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                                                                  style="ime-mode:disabled;"
                                                                                                  onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                                                              /
                                                                                              <select
                                                                                                  title="학점 총점"
                                                                                                  id="doctorgpaPointCode_${i.index+1}"
                                                                                                  name="doctorgpaPointCode_${i.index+1}"
                                                                                                  onChange="getText(this)">
                                                                                                  <option
                                                                                                      value="">
                                                                                                      <LTag:message
                                                                                                          code="app.lbl.select" />
                                                                                                  </option>
                                                                                                  <c:forEach
                                                                                                      items="${gpaTypeList.code}"
                                                                                                      varStatus="l">
                                                                                                      <option
                                                                                                          value="<c:out value='${gpaTypeList.code[l.index]}' />"
                                                                                                          <c:if
                                                                                                          test="${doctorInfo.gpaPointCode[i.index] == gpaTypeList.code[l.index]}">
                                                                                                          selected
                                                                                                          </c:if>
                                                                                                          >
                                                                                                          <c:out
                                                                                                              value='${gpaTypeList.value[l.index]}' />
                                                                                                      </option>
                                                                                                  </c:forEach>
                                                                                              </select>
                                                                                              <input
                                                                                                  type="hidden"
                                                                                                  id="doctorgpaPointCodeVal_${i.index+1}"
                                                                                                  name="doctorgpaPointCodeVal_${i.index+1}"
                                                                                                  value="<c:out value='${doctorInfo.gpaPointVal[i.index]}'/>" />
                                                                                          </span>
                                                                                      </td>
                                                                                  </tr>

                                                                          </c:when>
                                                                      </c:choose>


                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="doctormdDegreeCombined_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.masterDoctor" />
                                                                              </label></th>
                                                                          <td colspan="3">
                                                                              <input type="radio"
                                                                                  id="doctormdDegreeCombined_yes_${i.index+1}"
                                                                                  name="doctormdDegreeCombined_${i.index+1}"
                                                                                  value="Y" <c:if
                                                                                  test="${doctorInfo.mdDegreeCombined[i.index] == 'Y'}">
                                                                              checked="checked"
                                                                              </c:if> ><label
                                                                                  for="doctormdDegreeCombined_yes_${i.index+1}">Yes</label>
                                                                              <input type="radio"
                                                                                  id="doctormdDegreeCombined_no_${i.index+1}"
                                                                                  name="doctormdDegreeCombined_${i.index+1}"
                                                                                  value="N" <c:if
                                                                                  test="${doctorInfo.mdDegreeCombined[i.index] == 'N'}">
                                                                              checked="checked"
                                                                              </c:if> ><label
                                                                                  for="doctormdDegreeCombined_no_${i.index+1}">No</label>
                                                                          </td>
                                                                      </tr>
                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="doctoracademicAdvisorName_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.msprofessor" />
                                                                              </label></th>
                                                                          <td>
                                                                              <input type="text"
                                                                                  id="doctoracademicAdvisorName_${i.index+1}"
                                                                                  name="doctoracademicAdvisorName_${i.index+1}"
                                                                                  value="<c:out value='${doctorInfo.academicAdvisorName[i.index]}' />"
                                                                                  maxlength="300" />
                                                                          </td>
                                                                          <th scope="row"><label
                                                                                  class="required"
                                                                                  for="doctorlabName_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.mastersUnivLab" />
                                                                              </label></th>
                                                                          <td>
                                                                              <input type="text"
                                                                                  class="displayblock"
                                                                                  style="min-width:97%;"
                                                                                  id="doctorlabName_${i.index+1}"
                                                                                  name="doctorlabName_${i.index+1}"
                                                                                  value="<c:out value='${doctorInfo.labName[i.index]}' />"
                                                                                  maxlength="100" />
                                                                          </td>
                                                                      </tr>
                                                                      <tr>
                                                                          <th scope="row" rowspan="2">
                                                                              <label class="required"
                                                                                  for="doctortitleOfStudy_${i.index+1}"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.msfield" />
                                                                              </label></th>
                                                                          <td colspan="3">
                                                                              <span
                                                                                  class="LsubInstruction">
                                                                                  <LTag:message
                                                                                      code="app.cont.additionalTip13" />
                                                                              </span>
                                                                              <input type="text"
                                                                                  class="displayblock"
                                                                                  id="doctortitleOfStudy_${i.index+1}"
                                                                                  name="doctortitleOfStudy_${i.index+1}"
                                                                                  title="<LTag:message code="
                                                                                  app.lbl.msfield" />
                                                                              제목" value="
                                                                              <c:out
                                                                                  value='${doctorInfo.titleOfStudy[i.index]}' />
                                                                              " maxlength="300" />
                                                                          </td>
                                                                      </tr>
                                                                      <tr>
                                                                          <td colspan="3">
                                                                              <div class="td_sub">
                                                                                  <LTag:message
                                                                                      code="app.lbl.charLength" />
                                                                                  <span
                                                                                      id="doctorChar_${i.index+1}">
                                                                                      0</span>/ 1500
                                                                                  <LTag:message
                                                                                      code="app.lbl.char" />
                                                                              </div>
                                                                              <textarea
                                                                                  title="자신의 주 연구 분야를 자유롭게 기술하세요. (어필할 수 있는 논문/특허/프로젝트 등 포함)"
                                                                                  id="doctorcontent_${i.index+1}"
                                                                                  name="doctorcontent_${i.index+1}"
                                                                                  class="LtextArea"
                                                                                  placeholder="자신의 주 연구 분야를 자유롭게 기술하세요. (어필할 수 있는 논문/특허/프로젝트 등 포함)"><c:out value='${doctorInfo.content[i.index]}' /></textarea>
                                                                          </td>
                                                                      </tr>
                                                                      <tr>
                                                                          <th scope="row"><label
                                                                                  class="required"><span
                                                                                      class="Lhide">(필수)</span>
                                                                                  <LTag:message
                                                                                      code="app.lbl.mastersThesis" />
                                                                              </label></th>
                                                                          <td colspan="3"
                                                                              class="td_file">
                                                                              <div
                                                                                  class="set_selectInput hiddenInPhone hiddenInTablet">
                                                                                  <input type="hidden"
                                                                                      id="doctorattachFileId_${i.index+1}"
                                                                                      name="doctorattachFileId_${i.index+1}"
                                                                                      value="<c:out value='${doctorInfo.attachFileId[i.index]}'/>" />
                                                                                  <button
                                                                                      type="button"
                                                                                      class="btn_file"
                                                                                      onclick="addItem('#doctorThesis_${i.index+1}','doctor_${i.index+1}');"><span>
                                                                                          <LTag:message
                                                                                              code="app.lbl.addAttachFile" />
                                                                                      </span></button>
                                                                                  <ul id="doctorThesis_${i.index+1}"
                                                                                      class="LblockItemList Lfile">
                                                                                      <c:forEach
                                                                                          items="${schoolFileList.attachFileId}"
                                                                                          varStatus="j">
                                                                                          <c:if
                                                                                              test="${schoolFileList.attachFileId[j.index] == doctorInfo.attachFileId[i.index]}">
                                                                                              <li
                                                                                                  style="">
                                                                                                  <p><a href="javascript:;"
                                                                                                          onClick="fileDownload('${schoolFileList.dlFileName[j.index]}','${schoolFileList.attachFileId[j.index]}')">
                                                                                                          <c:out
                                                                                                              value='${schoolFileList.dlFileName[j.index]}' />
                                                                                                      </a><button
                                                                                                          type='button'
                                                                                                          onclick='deleteItem(this);'>삭제</button>
                                                                                                  </p>
                                                                                                  <input
                                                                                                      type="hidden"
                                                                                                      id="fileSeqNo"
                                                                                                      name="fileSeqNo"
                                                                                                      value="<c:out value='${schoolFileList.fileSeqNo[j.index]}'/>" />
                                                                                              </li>
                                                                                          </c:if>
                                                                                      </c:forEach>
                                                                                  </ul>
                                                                              </div>
                                                                              <div
                                                                                  class="Lexplanation displayInPhone">
                                                                                  <p>
                                                                                      <LTag:message
                                                                                          code="com.inf.029" />
                                                                                  </p>
                                                                                  <ul
                                                                                      class="LblockItemList Lfile">
                                                                                      <c:forEach
                                                                                          items="${schoolFileList.attachFileId}"
                                                                                          varStatus="j">
                                                                                          <c:if
                                                                                              test="${schoolFileList.attachFileId[j.index] == doctorInfo.attachFileId[i.index]}">
                                                                                              <li
                                                                                                  style="">
                                                                                                  <c:out
                                                                                                      value='${schoolFileList.dlFileName[j.index]}' />
                                                                                              </li>
                                                                                          </c:if>
                                                                                      </c:forEach>
                                                                                  </ul>
                                                                              </div>
                                                                          </td>
                                                                      </tr>

                              </tbody>
                          </table>
                  </div>
              </c:forEach>
              <div id="addDoctorDiv"></div>
              <div class="additionalTips">
                  <p>
                      <LTag:message code="app.cont.additionalTip9_1" />
                  </p>
                  <p>
                      <LTag:message code="app.cont.additionalTip11" />
                  </p>
              </div>
          </div>
      </div>
  </div>
  </c:if>


  <!-- 동의서 start -->
  <c:if test="${jobNoticeInfo.reputeAgreeYn == 'N' || jobNoticeInfo.saleSecViolAgreeYn == 'N'}">
      <div class="foldedInphone">
          <div class="dtFoldedInPhone">
              <div class="LblockPageSubtitle">
                  <h3>
                      <LTag:message code="app.lbl.agree" />
                  </h3>
              </div>
              <div class="LviewExplanation">
                  <c:if test="${jobNoticeInfo.reputeAgreeYn == 'N'}">
                      <p><strong>
                              <LTag:message code="app.lbl.agreeReputeWriteGuide" />
                          </strong><a href="#" onclick="agreeGuidePopup1();">
                              <LTag:message code="app.cont.view" />
                          </a></p>
                  </c:if>
                  <c:if test="${jobNoticeInfo.saleSecViolAgreeYn == 'N'}">
                      <p><strong>
                              <LTag:message code="app.lbl.agreeSaleWriteGuide" />
                          </strong><a href="#" onclick="agreeGuidePopup2();">
                              <LTag:message code="app.cont.view" />
                          </a></p>
                  </c:if>
              </div>
          </div>
          <div class="ddFoldedInPhone">
              <div class="LblockDetailTable">
                  <table class="applicationform rsp rsp-hori rsp-tablet">
                      <caption>
                          <LTag:message code="app.lbl.agree" />
                      </caption>
                      <colgroup>
                          <col style="width:25%;" />
                          <col style="width:75%;" />
                      </colgroup>
                      <tbody>
                          <c:if test="${jobNoticeInfo.reputeAgreeYn == 'N'}">
                              <tr>
                                  <th scope="row"><label class="required" for="reputeAgreeYn"><span
                                              class="Lhide">(필수)</span>
                                          <LTag:message code="app.lbl.repute.agree" />
                                      </label></th>
                                  <td>
                                      <div style="float:left">
                                          <input type="radio" id="reputeAgreeYn_yes"
                                              name="reputeAgreeYn" value="Y" <c:if
                                              test="${baseInfo.reputeAgreeYn=='Y'}"> checked="checked"
                          </c:if> disabled="disabled" /><label for="reputeAgreeYn_yes">동의함</label>
                          <input type="radio" id="reputeAgreeYn_no" name="reputeAgreeYn" value="N"
                              <c:if test="${baseInfo.reputeAgreeYn=='N'}"> checked="checked"
  </c:if> disabled="disabled" /><label for="reputeAgreeYn_no">동의하지 않음</label>
  <input type="hidden" id="reputeAgreeYn" name="reputeAgreeYn" value="${baseInfo.reputeAgreeYn}" />
  <input type="hidden" id="reputeSignatureName" name="reputeSignatureName"
      value="${baseInfo.reputeSignatureName}" />
  <input type="hidden" id="reputeSignatureBirthDt" name="reputeSignatureBirthDt"
      value="${baseInfo.reputeSignatureBirthDt}" />
  </div>
  <div style="float:left;margin-left:20px">
      <input type="checkbox" id="reputeAgreeSignature" value="Y" disabled="disabled" <c:if
          test="${baseInfo.reputeAgreeYn=='Y' || baseInfo.reputeAgreeYn=='N'}"> checked="checked"
      </c:if> /> 서명
  </div>
  <div class="LviewExplanation" style="float:left;width:160px;margin-left:20px">
      <p><strong>평판 조회 동의서</strong><a href="#"
              onclick="agreePopup('REPUTE','${jobNoticeInfo.reputeTypeCode}','${jobNoticeInfo.jobNoticeId}');">
              <LTag:message code="app.cont.view" />
          </a></p>
  </div>
  <%-- <br>
      <div>
          <sapn class="LinstructionWithinTable">
              <LTag:message code="com.inf.031" /></span>
      </div> --%>
      </td>
      </tr>
      </c:if>
      <c:if test="${jobNoticeInfo.saleSecViolAgreeYn == 'N'}">
          <tr>
              <th scope="row"><label class="required" for="saleSecViolAgreeYn"><span
                          class="Lhide">(필수)</span>
                      <LTag:message code="app.lbl.salesecviol.agree" />
                  </label></th>
              <td>
                  <div style="float:left">
                      <input type="radio" id="saleSecViolAgreeYn_yes" name="saleSecViolAgreeYn"
                          value="Y" <c:if test="${baseInfo.saleAgreeYn=='Y'}"> checked="checked"
      </c:if> disabled="disabled" /><label for="saleSecViolAgreeYn_yes">동의함</label>
      <input type="radio" id="saleSecViolAgreeYn_no" name="saleSecViolAgreeYn" value="N" <c:if
          test="${baseInfo.saleAgreeYn=='N'}"> checked="checked" </c:if> disabled="disabled" /><label
          for="saleSecViolAgreeYn_no">동의하지 않음</label>
      <input type="hidden" id="saleSecViolAgreeYn" name="saleSecViolAgreeYn"
          value="${baseInfo.saleAgreeYn}" />
      <input type="hidden" id="saleSignatureName" name="saleSignatureName"
          value="${baseInfo.saleSignatureName}" />
      <input type="hidden" id="saleSignatureBirthDt" name="saleSignatureBirthDt"
          value="${baseInfo.saleSignatureBirthDt}" />
      </div>
      <div style="float:left;margin-left:20px">
          <input type="checkbox" id="saleAgreeSignature" value="Y" disabled="disabled" <c:if
              test="${baseInfo.saleAgreeYn=='Y' || baseInfo.saleAgreeYn=='N'}"> checked="checked"
          </c:if> /> 서명
      </div>
      <div class="LviewExplanation" style="float:left;width:200px;margin-left:20px">
          <p><strong>영업비밀 침해금지 동의서</strong><a href="#"
                  onclick="agreePopup('SALE','X','${jobNoticeInfo.jobNoticeId}');">
                  <LTag:message code="app.cont.view" />
              </a></p>
      </div>
      </td>
      </tr>
      </c:if>
      </tbody>
      </table>
      </div>
      </div>
      </div>
      </c:if>
      <!-- 동의서 end -->
      <!-- 공인어학성적 -->
      <c:if test="${jobNoticeInfo.languageInputFlag == 'N'}">
          <div class="foldedInphone">
              <div class="dtFoldedInPhone btnmore">
                  <div class="LblockPageSubtitle">
                      <h3>
                          <LTag:message code="app.lbl.languageGrade" /> <span
                              id="languageCount">(1)</span>
                      </h3>
                      <div class="subtitleBtn">
                          <a href="#" id="languageAddBtn" class="btn_more"><span class="Lhide">
                                  <LTag:message code="app.lbl.languageGrade" />
                              </span>추가</a>
                      </div>
                  </div>
              </div>
              <div class="ddFoldedInPhone">
                  <div class="LblockListTable headerTop">
                      <table id="languageTable" class="applyformHeaderTop rsp rsp-basic">
                          <caption>
                              <LTag:message code="app.lbl.languageGrade" />
                          </caption>
                          <colgroup>
                              <col style="width:20%;" />
                              <col style="width:20%;" />
                              <col style="width:25%;" />
                              <col style="width:30%;" />
                              <col style="width:5%;" />
                          </colgroup>
                          <thead>
                              <tr>
                                  <th scope="col"><label class="required"
                                          for="offilanguageCode_1"><span class="Lhide"></span>
                                          <LTag:message code="app.lbl.language" />
                                      </label></th>
                                  <th scope="col"><label class="required"
                                          for="offilangTestCode_1"><span class="Lhide"></span>
                                          <LTag:message code="app.lbl.testName" />
                                      </label></th>
                                  <th scope="col"><label class="required"
                                          for="offipointGradeValue_1"><span class="Lhide"></span>
                                          <c:choose>
                                              <c:when test="${jobNoticeInfo.passOption == 'Y'}">
                                                  <LTag:message code="app.lbl.passOptionFlag" />
                                              </c:when>
                                              <c:otherwise>
                                                  <LTag:message code="app.lbl.testScore" />
                                              </c:otherwise>
                                          </c:choose>
                                      </label></th>
                                  <th scope="col"><label class="required" for="offitestDate_1"><span
                                              class="Lhide"></span>
                                          <LTag:message code="app.lbl.acquiredDate" />
                                      </label></th>
                                  <th scope="col"></th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td>
                                      <select id="offilanguageCode_1" name="offilanguageCode_1"
                                          onChange="getlangTestList(this,'')"
                                          title="<LTag:message code=" app.lbl.language" />">
                                      <option value="">
                                          <LTag:message code="app.lbl.select" />
                                      </option>
                                      <c:forEach items="${languageTypeList.code}" varStatus="l">
                                          <option
                                              value="<c:out value='${languageTypeList.code[l.index]}' />">
                                              <c:out value='${languageTypeList.value[l.index]}' />
                                          </option>
                                      </c:forEach>
                                      </select>
                                  </td>
                                  <td>
                                      <select id="offilangTestCode_1" name="offilangTestCode_1"
                                          onChange="getGradeValueList(this,'')"
                                          title="<LTag:message code=" app.lbl.testName" />">
                                      <option value="">
                                          <LTag:message code="app.lbl.select" />
                                      </option>
                                      </select>
                                  </td>
                                  <td>
                                      <div id="divoffipointGradeValue_1">
                                          <c:choose>
                                              <c:when test="${jobNoticeInfo.passOption == 'Y'}">
                                                  <select id="offipointGradeValue_1"
                                                      name="offipointGradeValue_1"
                                                      title="<LTag:message code="
                                                      app.lbl.passOptionFlag" />">
                                                  <option value="">
                                                      <LTag:message code="app.lbl.select" />
                                                  </option>
                                                  <option value="PASS" <c:if
                                                      test="${languageTypeList.pointGradeValue[j.index] == 'PASS'}">
                                                      selected
      </c:if>>Pass</option>
      <option value="FAIL" <c:if test="${languageTypeList.pointGradeValue[j.index] == 'FAIL'}">
          selected </c:if>>Fail</option>
      </select>
      </c:when>
      <c:otherwise>
          <select id="offipointGradeValue_1" name="offipointGradeValue_1" title="<LTag:message code="
              app.lbl.testScore" />">
          <option value="">
              <LTag:message code="app.lbl.select" />
          </option>
          </select>
      </c:otherwise>

      </c:choose>
      </div>
      </td>
      <td>
          <input type="text" class="Ltext dateText" id="offitestDate_1" name="offitestDate_1"
              size="11" maxlength="11" readonly="readonly" title="<LTag:message code="
              app.lbl.acquiredDate" />">
          <button type="button" class="LiconCalendar" id="offiCal"
              data-calendar="offitestDate_1">달력</button>
      </td>
      <td>
          <a href="javascript:;" id="languageDelBtn_1" onClick="deleteRow(this);"><span class="image"
                  data-src="ico_deleteAboveRow.png" data-alt="행 삭제"></span></a>
      </td>
      </tr>
      </tbody>
      </table>
      </div>
      <div class="additionalTips">
          <p>해당 직무와 연관성이 높은 항목부터 입력해주시기 바랍니다.</p>
          <p>
              <LTag:message code="app.cont.additionalTip16" />
          </p>
      </div>
      </div>
      </div>
      </c:if>

      <c:if test="${jobNoticeInfo.globalInputFlag == 'N'}">
          <div class="foldedInphone">
              <div class="dtFoldedInPhone btnmore">
                  <div class="LblockPageSubtitle">
                      <h3>
                          <LTag:message code="app.titl.global" /> <span id="globalCount">(
                              <c:out value='${globalCount}' />)
                          </span>
                      </h3>
                      <div class="subtitleBtn">
                          <a href="#" id="globalAddBtn" class="btn_more"><span class="Lhide">
                                  <LTag:message code="app.titl.global" />
                              </span>추가</a>
                      </div>
                  </div>
              </div>
              <div class="ddFoldedInPhone">
                  <div class="LblockListTable headerTop">
                      <table id="globalTable" class="applyformHeaderTop rsp rsp-basic">
                          <caption>
                              <LTag:message code="app.titl.global" />
                          </caption>
                          <colgroup>
                              <col style="width:30%;" />
                              <col style="width:35%;" />
                              <col style="width:30%;" />
                              <col style="width:5%;" />
                          </colgroup>
                          <thead>
                              <tr>
                                  <th scope="col"><label class="required"
                                          for="glolanguageType_1"><span class="Lhide"></span>
                                          <LTag:message code="app.lbl.language" />
                                      </label></th>
                                  <th scope="col"><label class="required"
                                          for="glouseCountryCode_1"><span class="Lhide"></span>
                                          <LTag:message code="app.lbl.languageNation" />
                                      </label></th>
                                  <th scope="col"><label class="required"
                                          for="glouseStartDate_1"><span class="Lhide"></span>
                                          <LTag:message code="app.lbl.languageLevel" /><a
                                              href="javascript:;" onclick="languageGuidePopup();"
                                              target="_blank" title="새 창"> <span class="image"
                                                  data-src="btn_icon_question.png"
                                                  data-alt="외국어 역량 가이드 팝업"></span></a>
                                      </label></th>
                                  <th scope="col"></th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach items="${globalCompetList.jobNoticeId}" varStatus="i">
                                  <tr>
                                      <td>
                                          <select class="glolanguageType"
                                              id="glolanguageType_${i.index+1}"
                                              name="glolanguageType_${i.index+1}"
                                              title="<LTag:message code=" app.lbl.language" />">
                                          <option value="">
                                              <LTag:message code="app.lbl.select" />
                                          </option>
                                          <c:forEach items="${languageTypeList2.code}" varStatus="l">
                                              <option
                                                  value="<c:out value='${languageTypeList2.code[l.index]}' />"
                                                  <c:if
                                                  test="${globalCompetList.languageType[i.index] == languageTypeList2.code[l.index]}">
                                                  selected
      </c:if>>
      <c:out value='${languageTypeList2.value[l.index]}' />
      </option>
      </c:forEach>
      </select>
      </td>
      <td>
          <div class="input_search">
              <input type="text" class="glouseCountryName" id="glouseCountryName_${i.index+1}"
                  name="glouseCountryName_${i.index+1}" size="40"
                  value="<c:out value='${globalCompetList.useCountryName[i.index]}' />"
                  readonly="readonly" title="<LTag:message code=" app.lbl.languageNation" />" <c:if
                  test="${not (globalCompetList.languageType[i.index] eq 'LANG999')}">
                  disabled="disabled"</c:if>/>
              <input type="hidden" class="glouseCountryCode" id="glouseCountryCode_${i.index+1}"
                  name="glouseCountryCode_${i.index+1}"
                  value="<c:out value='${globalCompetList.useCountryCode[i.index]}' />" />
              <button type="button" onclick="searchCodePopup(this,'NA');">검색</button>
          </div>
      </td>
      <td>
          <select class="glolanguageLevel" id="glolanguageLevel_${i.index+1}"
              name="glolanguageLevel_${i.index+1}" title="<LTag:message code="
              app.lbl.languageLevel" />">
          <option value="">
              <LTag:message code="app.lbl.select" />
          </option>
          <c:forEach items="${languageLevelList.code}" varStatus="l">
              <option value="<c:out value='${languageLevelList.code[l.index]}' />" <c:if
                  test="${globalCompetList.languageLevel[i.index] == languageLevelList.code[l.index]}">
                  selected </c:if>>
                  <c:out value='${languageLevelList.value[l.index]}' />
              </option>
          </c:forEach>
          </select>
          <%-- FPT - Static Analysis Handle - DELETE --%>
      </td>
      <td>
          <a href="javascript:;" id="globalDelBtn_${i.index+1}" onClick="deleteRow(this);"><span
                  class="image" data-src="ico_deleteAboveRow.png" data-alt="행 삭제"></span></a>
      </td>
      </tr>
      </c:forEach>
      </tbody>
      </table>
      </div>
      </div>
      <div class="additionalTips">
          <p>사용국가는 '기타 제 3외국어'를 선택하신 경우에 한해 정확히 입력해 주시기 바랍니다.</p>
      </div>
      </div>
      </c:if>

      <!-- 자격증 -->
      <c:if test="${jobNoticeInfo.qualificationInputFlag == 'N'}">
          <div class="foldedInphone">
              <div class="dtFoldedInPhone btnmore">
                  <div class="LblockPageSubtitle">
                      <h3>
                          <LTag:message code="app.titl.qualif" /> <span id="qualifCount">(
                              <c:out value='${qualifiCount}' />)
                          </span>
                      </h3>
                      <div class="subtitleBtn">
                          <a href="#" id="qualifAddBtn" class="btn_more"><span class="Lhide">
                                  <LTag:message code="app.titl.qualif" />
                              </span>추가</a>
                      </div>
                  </div>
              </div>
              <div class="ddFoldedInPhone">
                  <div class="LblockListTable headerTop">
                      <table id="qualifTable" class="applyformHeaderTop rsp rsp-basic">
                          <caption>
                              <LTag:message code="app.titl.qualif" />
                          </caption>
                          <colgroup>
                              <col style="width:20%;" />
                              <col style="width:20%;" />
                              <col style="width:25%;" />
                              <col style="width:20%;" />
                              <col style="width:5%;" />
                          </colgroup>
                          <thead>
                              <tr>
                                  <th scope="col"><label class="required"
                                          for="certiqualificationName_1"><span class="Lhide"></span>
                                          <LTag:message code="app.lbl.qualificationName" />
                                      </label></th>
                                  <th scope="col"><label class="required"
                                          for="certiqualGradeName_1"><span class="Lhide"></span>
                                          <LTag:message code="app.lbl.qualGrade" />
                                      </label></th>
                                  <th scope="col"><label class="required"
                                          for="certiacquisitionDate_1"><span class="Lhide"></span>
                                          <LTag:message code="app.lbl.acquiredDate" />
                                      </label></th>
                                  <th scope="col"><label class="required"
                                          for="certicertInstitutionName_1"><span class="Lhide"></span>
                                          <LTag:message code="app.lbl.certInstitution" />
                                      </label></th>
                                  <th scope="col"></th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach items="${qualificationList.jobNoticeId}" varStatus="i">
                                  <tr>
                                      <td>
                                          <div class="input_search">
                                              <input type="text"
                                                  id="certiqualificationName_${i.index+1}"
                                                  name="certiqualificationName_${i.index+1}"
                                                  value="<c:out value='${qualificationList.qualificationName[i.index]}' />"
                                                  size="10" readonly="readonly"
                                                  title="<LTag:message code="
                                                  app.lbl.qualificationName" />" />
                                              <input type="hidden"
                                                  id="certiqualificationCode_${i.index+1}"
                                                  name="certiqualificationCode_${i.index+1}"
                                                  value="<c:out value='${qualificationList.qualificationCode[i.index]}'/>" />
                                              <button type="button"
                                                  onclick="searchCodePopup(this,'CR');">검색</button>
                                          </div>
                                      </td>
                                      <td>
                                          <input type="text" class="Ltext"
                                              id="certiqualGradeName_${i.index+1}"
                                              name="certiqualGradeName_${i.index+1}"
                                              value="<c:out value='${qualificationList.qualGradeName[i.index]}' />"
                                              size="10" maxlength="100" title="<LTag:message code="
                                              app.lbl.qualGrade" />" >
                                      </td>
                                      <td>
                                          <input type="text" class="Ltext calendarDate"
                                              id="certiacquisitionDate_${i.index+1}"
                                              name="certiacquisitionDate_${i.index+1}"
                                              value="<c:out value='${qualificationList.acquisitionDate[i.index]}' />"
                                              size="11" maxlength="11" readonly="readonly"
                                              title="<LTag:message code=" app.lbl.acquiredDate" />" >
                                          <button type="button" class="LiconCalendar" id="cal"
                                              data-position="up"
                                              data-calendar="certiacquisitionDate_${i.index+1}">달력</button>
                                      </td>
                                      <td>
                                          <input type="text" class="Ltext"
                                              id="certicertInstitutionName_${i.index+1}"
                                              name="certicertInstitutionName_${i.index+1}"
                                              value="<c:out value='${qualificationList.certInstitutionName[i.index]}' />"
                                              size="10" maxlength="100" title="<LTag:message code="
                                              app.lbl.certInstitution" />" >
                                      </td>
                                      <td>
                                          <a href="javascript:;" id="qualDelBtn_${i.index+1}"
                                              onClick="deleteRow(this);"><span class="image"
                                                  data-src="ico_deleteAboveRow.png"
                                                  data-alt="행 삭제"></span></a>
                                      </td>
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table>
                  </div>
                  <div class="additionalTips">
                      <p>
                          <LTag:message code="app.cont.additionalTip21" />
                      </p>
                      <p>
                          <LTag:message code="app.cont.additionalTip20" />
                      </p>
                      <p>
                          <LTag:message code="app.cont.additionalTip17" />
                      </p>
                  </div>
              </div>
          </div>
      </c:if>

      <!-- 추가입력사항 -->
      <c:if test="${jobNoticeInfo.addTextFlag == 'N'}">

          <c:forEach items="${addTextList.jobNoticeId}" varStatus="i">
              <div class="foldedInphone addTextElement">
                  <div class="dtFoldedInPhone btnmore">
                      <div class="LblockPageSubtitle">
                          <h3>
                              <c:out value='${addTextList.categoryName[i.index]}' />
                          </h3>
                      </div>
                  </div>
                  <div class="ddFoldedInPhone">
                      <div class="LblockListTable languageSelect">
                          <table class="applyformHeaderTop">
                              <caption>
                                  <c:out value='${addTextList.title[i.index]}' />
                              </caption>
                              <colgroup>
                                  <col style="width:100%;" />
                              </colgroup>
                              <thead>
                                  <tr>
                                      <th style="text-align: left" scope="col"><label>
                                              <c:out value='${addTextList.title[i.index]}' />
                                          </label></th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td style="text-align: left;">
                                          <input type="hidden" name="customFieldId"
                                              value="${addTextList.customFieldId[i.index]}" />
                                          <input type="hidden" name="categoryName"
                                              value="${addTextList.categoryName[i.index]}" />
                                          <input type="hidden" name="title"
                                              value="${addTextList.title[i.index]}" />
                                          <c:choose>
                                              <c:when test="${addTextList.type[i.index] eq 'TEXT'}">
                                                  <input type="hidden" name="addTextValue"
                                                      value="${addTextList.value[i.index]}" />
                                                  <c:forEach begin="0"
                                                      end="${jobNoticeInfo.addTextInputNum-1}"
                                                      step="1" varStatus="k">
                                                      <input type="text"
                                                          name="addTextValue_${k.index}"
                                                          class="addTextValue"
                                                          value="${fn:split(addTextList.value[i.index],'§')[k.index]}" />
                                                  </c:forEach>
                                              </c:when>

                                              <c:when
                                                  test="${addTextList.type[i.index] eq 'TEXTAREA'}">
                                                  <textarea
                                                      name="addTextValue"><c:out value="${addTextList.value[i.index]}"/></textarea>
                                              </c:when>
                                              <c:when
                                                  test="${addTextList.type[i.index] eq 'CHECKBOX'}">
                                                  <input type="hidden" name="addTextValue"
                                                      value="${addTextList.value[i.index]}" />
                                                  <c:forTokens items="${addTextList.labels[i.index]}"
                                                      delims="§" var="tag">
                                                      <c:set var="addTextChecboxChecked"
                                                          value="false" />
                                                      <c:forTokens
                                                          items="${addTextList.value[i.index]}"
                                                          delims="§" var="valueToken">
                                                          <c:if test="${tag eq valueToken}">
                                                              <c:set var="addTextChecboxChecked"
                                                                  value="true" />
                                                          </c:if>
                                                      </c:forTokens>
                                                      <c:choose>
                                                          <c:when
                                                              test="${addTextChecboxChecked eq 'true'}">
                                                              <input type="checkbox"
                                                                  class="addTextValue" value="${tag}"
                                                                  checked="checked" />
                                                              <c:out value="${tag}" />
                                                          </c:when>
                                                          <c:otherwise>
                                                              <input type="checkbox"
                                                                  class="addTextValue"
                                                                  value="${tag}" />
                                                              <c:out value="${tag}" />
                                                          </c:otherwise>
                                                      </c:choose>
                                                  </c:forTokens>
                                              </c:when>
                                              <c:when test="${addTextList.type[i.index] eq 'RADIO'}">
                                                  <c:forTokens items="${addTextList.labels[i.index]}"
                                                      delims="§" var="tag">
                                                      <c:choose>
                                                          <c:when
                                                              test="${tag eq addTextList.value[i.index]}">
                                                              <input type="radio" name="addTextValue"
                                                                  value="${tag}" checked="checked" />
                                                              <c:out value="${tag}" />
                                                          </c:when>
                                                          <c:otherwise>
                                                              <input type="radio" name="addTextValue"
                                                                  value="${tag}" />
                                                              <c:out value="${tag}" />
                                                          </c:otherwise>
                                                      </c:choose>
                                                  </c:forTokens>
                                              </c:when>
                                              <c:when test="${addTextList.type[i.index] eq 'SELECT'}">
                                                  <select name="addTextValue">
                                                      <c:forTokens
                                                          items="${addTextList.labels[i.index]}"
                                                          delims="§" var="tag">
                                                          <c:choose>
                                                              <c:when
                                                                  test="${tag eq addTextList.value[i.index]}">
                                                                  <option value="${tag}"
                                                                      selected="selected">
                                                                      <c:out value="${tag}" />
                                                                  </option>
                                                              </c:when>
                                                              <c:otherwise>
                                                                  <option value="${tag}">
                                                                      <c:out value="${tag}" />
                                                                  </option>
                                                              </c:otherwise>
                                                          </c:choose>
                                                      </c:forTokens>
                                                  </select>
                                              </c:when>
                                          </c:choose>
                                      </td>
                                  </tr>
                              </tbody>
                          </table>
                      </div>
                  </div>
              </div>
          </c:forEach>

      </c:if>
      </form>
      <!-- appDetailForm end -->

      <div class="LblockTabButton">
          <button type="button" class="btn_back" onclick="nextTab(this,0);"><span>
                  <LTag:message code="app.btn.back" />
              </span></button>
          <c:if
              test="${jobNoticeInfo.schoolInputFlag == 'N' || jobNoticeInfo.qualificationInputFlag == 'N' || jobNoticeInfo.languageInputFlag == 'N' || jobNoticeInfo.globalInputFlag =='N'}">
              <button type="button" id="btnSaveAppDetail"><span>
                      <LTag:message code="com.btn.save" />
                  </span></button>
          </c:if>
          <button type="button" onclick="nextTab(this,2);"><span>
                  <LTag:message code="com.btn.next" />
              </span></button>
      </div>

      </div>
      <!-- appDetailForm end div -->

      <c:if test="${jobNoticeInfo.careerTypeCode != 'A' && jobNoticeInfo.careerTypeCode != 'C'}">
          <div id="LblockTabContent03" class="LblockTabContent">
              <form id="prevExpInfoForm" name="prevExpInfoForm" method="post">
                  <rec:savedToken name="sessionscopeexp" scope="session" />
                  <h2 class="Lhide">
                      <LTag:message code="app.tab.prevExpInfo" />
                  </h2>
                  <div class="LviewExplanation">
                      <p><strong>
                              <LTag:message code="app.btn.applyWriteGuide" />
                          </strong><a href="#" onclick="applcationGuidePopup();">
                              <LTag:message code="app.cont.view" />
                          </a></p>
                  </div>
                  <c:if test="${!empty beforeAppExprInfo.jobNoticeId}">
                      <div class="LblockPageLink">
                          <p class="links" id="beforePrevExpr">
                              <LTag:message code="app.cont.topCont_1" /> <a href="javascript:;"
                                  onClick="retrieveBeforeAppExpr();">
                                  <c:choose>
                                      <c:when
                                          test="${jobNoticeInfo.careerTypeCode == 'A' || jobNoticeInfo.careerTypeCode == 'C'}">
                                          <LTag:message code="app.cont.sociTopCont_3" />
                                      </c:when>
                                      <c:otherwise>
                                          <LTag:message code="app.cont.topCont_3" />
                                      </c:otherwise>
                                  </c:choose>
                              </a>
                          </p>
                      </div>
                  </c:if>
                  <div class="foldedInphone">
                      <div class="dtFoldedInPhone btnmore">
                          <div class="LblockPageSubtitle">
                              <h3>
                                  <c:choose>
                                      <c:when
                                          test="${jobNoticeInfo.careerTypeCode == 'A' || jobNoticeInfo.careerTypeCode == 'C'}">
                                          <LTag:message code="app.titl.sociExp" />
                                      </c:when>
                                      <c:otherwise>
                                          <LTag:message code="app.titl.prevExpInfo" />
                                      </c:otherwise>
                                  </c:choose>
                              </h3>
                              <div class="subtitleBtn">
                                  <a href="#" id="exprAddBtn" class="btn_more"><span class="Lhide">
                                          <c:choose>
                                              <c:when
                                                  test="${jobNoticeInfo.careerTypeCode == 'A' || jobNoticeInfo.careerTypeCode == 'C'}">
                                                  <LTag:message code="app.titl.sociExp" />
                                              </c:when>
                                              <c:otherwise>
                                                  <LTag:message code="app.titl.prevExpInfo" />
                                              </c:otherwise>
                                          </c:choose>
                                      </span>추가</a>
                              </div>
                          </div>
                      </div>
                      <div class="ddFoldedInPhone">
                          <div id="LblockCareers">
                              <c:forEach items="${prevExperList.jobNoticeId}" varStatus="k">
                                  <c:if test="${k.index != 0}">
                                      <div class="btn_deleteTable"><button type="button"
                                              onClick="delDataInfo(this);">다음 항목 삭제</button></div>
                                  </c:if>

                                  <div class="LblockDetailTable">
                                      <table class="applicationform rsp rsp-hori rsp-tablet">
                                          <caption>
                                              <LTag:message code="app.tab.prevExpInfo" />
                                          </caption>
                                          <colgroup>
                                              <col style="width:15%;" />
                                              <col style="width:35%;" />
                                              <col style="width:15%;" />
                                              <col style="width:35%;" />
                                          </colgroup>
                                          <tbody>
                                              <tr>
                                                  <th scope="row">
                                                      <input type="hidden" id="wperiod_${k.index+1}"
                                                          name="wperiod_${k.index+1}"
                                                          value="<c:out value='${prevExperList.wperiod[k.index]}' />" />
                                                      <label class="required"
                                                          for="companyName_${k.index+1}"><span
                                                              class="Lhide">(필수)</span>
                                                          <LTag:message code="app.lbl.companyName" />
                                                      </label>
                                                  </th>
                                                  <td>
                                                      <input type="text" id="companyName_${k.index+1}"
                                                          name="companyName_${k.index+1}"
                                                          value="<c:out value='${prevExperList.companyName[k.index]}' />"
                                                          maxlength="100" />
                                                  </td>
                                                  <th scope="row"><label class="required"
                                                          for="startDate_${k.index+1}"><span
                                                              class="Lhide">(필수)</span>
                                                          <LTag:message code="app.lbl.preriodDate" />
                                                      </label></th>
                                                  <td>
                                                      <input type="text" class="Ltext"
                                                          id="startDate_${k.index+1}"
                                                          name="startDate_${k.index+1}" size="11"
                                                          maxlength="7" placeholder="YYYY.MM"
                                                          title="기간 시작일(YYYY.MM)"
                                                          value="<c:out value='${prevExperList.startDate[k.index]}' />"
                                                          onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                          style="ime-mode:disabled;"
                                                          onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                      <label>~</label>
                                                      <input type="text" class="Ltext"
                                                          id="endDate_${k.index+1}" size="11"
                                                          name="endDate_${k.index+1}" maxlength="7"
                                                          placeholder="YYYY.MM"
                                                          title="기간 종료일(YYYY.MM)"
                                                          value="<c:out value='${prevExperList.endDate[k.index]}' />"
                                                          onKeyPress="return $.onKeyPressFilter('[0-9.]', event);"
                                                          style="ime-mode:disabled;"
                                                          onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                                                      <span id="calculDate_${k.index+1}"
                                                          class="displayblockInPhone">
                                                          <c:if
                                                              test='${!empty prevExperList.wperiod[k.index]}'>
                                                              (
                                                              <c:out
                                                                  value='${prevExperList.wperiod[k.index]}' />
                                                              )
                                                          </c:if>
                                                      </span>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><label class="required"
                                                          for="careerLocationName_${k.index+1}"><span
                                                              class="Lhide">(필수)</span>
                                                          <LTag:message code="app.lbl.locationName" />
                                                      </label></th>
                                                  <td>
                                                      <div class="input_search">
                                                          <input type="text"
                                                              id="careerLocationName_${k.index+1}"
                                                              name="locationName_${k.index+1}"
                                                              size="10"
                                                              value="<c:out value='${prevExperList.locationName[k.index]}' />"
                                                              readonly="readonly" maxlength="300" />
                                                          <input type="hidden"
                                                              id="careerAddressSido_${k.index+1}"
                                                              name="addressSido_${k.index+1}"
                                                              value="<c:out value='${prevExperList.addressSido[k.index]}' />" />
                                                          <input type="hidden"
                                                              id="careerAddressSigu_${k.index+1}"
                                                              name="addressSigu_${k.index+1}"
                                                              value="<c:out value='${prevExperList.addressSigu[k.index]}' />" />
                                                          <button type="button"
                                                              onclick="searchSchoolLocPopup(this);">검색</button>
                                                      </div>
                                                  </td>
                                                  <th scope="row"><label class="required"
                                                          for="orgName_${k.index+1}"><span
                                                              class="Lhide">(필수)</span>
                                                          <LTag:message code="app.lbl.interdept" />
                                                      </label></th>
                                                  <td>
                                                      <input type="text" id="orgName_${k.index+1}"
                                                          name="orgName_${k.index+1}"
                                                          value="<c:out value='${prevExperList.orgName[k.index]}' />"
                                                          maxlength="300" />
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><label for="gradeName_${k.index+1}">
                                                          <LTag:message code="app.lbl.jobPosition" />
                                                      </label></th>
                                                  <td>
                                                      <input type="text" id="gradeName_${k.index+1}"
                                                          name="gradeName_${k.index+1}"
                                                          value="<c:out value='${prevExperList.gradeName[k.index]}' />"
                                                          maxlength="100" />
                                                  </td>
                                                  <th scope="row"><label class="required"
                                                          for="careerJobCode_${k.index+1}"><span
                                                              class="Lhide">(필수)</span>
                                                          <LTag:message code="app.lbl.jobCode" />
                                                      </label></th>
                                                  <td>
                                                      <input type="text"
                                                          id="careerJobCode_${k.index+1}"
                                                          name="jobCode_${k.index+1}"
                                                          value="<c:out value='${prevExperList.jobCode[k.index]}' />"
                                                          maxlength="30" />
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><label class="required"
                                                          for="exitReasonCode_${k.index+1}"><span
                                                              class="Lhide">(필수)</span>
                                                          <LTag:message code="app.lbl.retireReason" />
                                                      </label></th>
                                                  <td>
                                                      <span class="set_selectInput">
                                                          <select id="exitReasonCode_${k.index+1}"
                                                              name="exitReasonCode_${k.index+1}"
                                                              onChange="changeExitReason(this)"
                                                              class="minwidth100">
                                                              <option value="">
                                                                  <LTag:message
                                                                      code="app.lbl.select" />
                                                              </option>
                                                              <c:forEach
                                                                  items="${retirementList.code}"
                                                                  varStatus="l">
                                                                  <option
                                                                      value="<c:out value='${retirementList.code[l.index]}' />"
                                                                      <c:if
                                                                      test="${retirementList.code[l.index] == prevExperList.exitReasonCode[k.index] }">
                                                                      selected="selected"
      </c:if>>
      <c:out value='${retirementList.value[l.index]}' />
      </option>
      </c:forEach>
      </select>
      <input title="퇴직사유 직접입력" type="text" id="exitReasonDetail_${k.index+1}" class="blockInPhone"
          name="exitReasonDetail_${k.index+1}" size="10" style="width:60%;" <c:if
          test="${prevExperList.exitReasonCode[k.index] != 'RETIRE099'}"> disabled="disabled" </c:if>
      value="
      <c:out value='${prevExperList.exitReasonDetail[k.index]}' />" maxlength="100" />
      </span>
      <input type="hidden" id="index_${k.index+1}" name="index_${k.index+1}" value="${k.index+1}" />
      </td>
      <th scope="row"><label for="salary_${k.index+1}">
              <LTag:message code="app.lbl.salary" />
          </label></th>
      <td>
          <input type="text" id="salary_${k.index+1}" name="salary_${k.index+1}"
              value="<c:out value='${prevExperList.salary[k.index]}' />" maxlength="15"
              onKeyPress="return $.onKeyPressFilter('[0-9]', event);" style="ime-mode:disabled;"
              onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" />
      </td>
      </tr>
      </tbody>
      </table>
      <table class="detailexplain">
          <caption>
              <LTag:message code="app.tab.prevExpInfo" /> - 직무경험
          </caption>
          <thead>
              <tr>
                  <th scope="col" class="LtextLeft">
                      <label class="required" for="expContent_${i.index+1}"><span
                              class="Lhide">(필수)</span>
                          <LTag:message code="app.lbl.expDetailContent" />
                      </label>
                  </th>
              </tr>
          </thead>
          <tbody>
              <tr>
                  <td>
                      <textarea id="expContent_${k.index+1}" name="expContent_${k.index+1}"
                          class="LtextArea"><c:out value='${prevExperList.expContent[k.index]}' /></textarea>
                  </td>
              </tr>
          </tbody>
      </table>
      </div>
      </c:forEach>
      </div>
      <div class="additionalTips">
          <p>
              <LTag:message code="app.cont.additionalTip5" />
          </p>
          <p>
              <LTag:message code="app.cont.additionalTip6" />
          </p>
          <p>
              <LTag:message code="app.cont.additionalTip19" />
          </p>
      </div>
      </div>
      </div>
      <c:if test="${jobNoticeInfo.careerTypeCode == 'B' || jobNoticeInfo.careerTypeCode == 'D'}">
          <h3>
              <LTag:message code="app.titl.addInfo" />
          </h3>
          <div class="LblockDetailTable">
              <table class="applicationdetails rsp rsp-hori rsp-tablet">
                  <caption>
                      <LTag:message code="app.titl.addInfo" />
                  </caption>
                  <colgroup>
                      <col style="width:23%" />
                      <col style="width:30%" />
                      <col style="width:17%" />
                      <col style="width:30%" />
                  </colgroup>
                  <tbody>
                      <tr>
                          <th scope="row"><label class="required" for="targetSalary"><span
                                      class="Lhide">(필수)</span>
                                  <LTag:message code="app.lbl.targetSalary" />
                              </label></th>
                          <td>
                              <input id="targetSalary" name="targetSalary" type="text"
                                  value="<c:out value='${baseInfo.targetSalary}'/>" size="15"
                                  maxlength="15"
                                  onKeyPress="return $.onKeyPressFilter('[0-9]', event);"
                                  style="ime-mode:disabled;"
                                  onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" />
                          </td>
                          <th scope="row"><label class="required" for="entryDate"><span
                                      class="Lhide">(필수)</span>
                                  <LTag:message code="app.lbl.entryDate" />
                              </label></th>
                          <td>
                              <input id="entryDate" name="entryDate" type="text" class="Ltext"
                                  value="<c:out value='${baseInfo.entryDate}' />" size="11">
                              <button type="button" class="LiconCalendar" data-position="up"
                                  data-calendar="entryDate">달력</button>
                          </td>
                      </tr>
                  </tbody>
              </table>
          </div>
      </c:if>
      </form>
      <div class="LblockTabButton">
          <button type="button" class="btn_back" onclick="nextTab(this,1);"><span>
                  <LTag:message code="app.btn.back" />
              </span></button>
          <button type="button" id="btnSavePreExp"><span>
                  <LTag:message code="com.btn.save" />
              </span></button>
          <button type="button" onclick="nextTab(this,3);"><span>
                  <LTag:message code="com.btn.next" />
              </span></button>
      </div>
      </div>
      </c:if>
      <div id="LblockTabContent04" class="LblockTabContent">
          <form id="introInfoForm" name="introInfoForm" method="post">
              <rec:savedToken name="sessionscopeintro" scope="session" />
              <h2 class="Lhide">
                  <c:choose>
                      <c:when
                          test="${jobNoticeInfo.careerTypeCode == 'A' || jobNoticeInfo.careerTypeCode == 'C'}">
                          <LTag:message code="app.tab.applicationTr" />
                      </c:when>
                      <c:otherwise>
                          <LTag:message code="app.tab.application" />
                      </c:otherwise>
                  </c:choose>
              </h2>
              <div class="LviewExplanation">
                  <p><strong>
                          <LTag:message code="app.btn.applyWriteGuide" />
                      </strong><a href="#" onclick="applcationGuidePopup();">
                          <LTag:message code="app.cont.view" />
                      </a></p>
              </div>
              <%-- FPT - Static Analysis Handle - DELETE --%>
                  <c:forEach items="${appIntroduceInfo.jobNoticeId}" varStatus="i">
                      <input type="hidden" id="introTypes_${i.index+1}" name="introTypes_${i.index+1}"
                          value="<c:out value='${appIntroduceInfo.introTypes[i.index]}'/>" />
                      <input type="hidden" id="careerType_${i.index+1}" name="careerType_${i.index+1}"
                          value="<c:out value='${appIntroduceInfo.careerType[i.index]}'/>" />
                      <h3>
                          <c:out value='${appIntroduceInfo.questionType[i.index]}' />
                      </h3>
                      <div class="LblockDetailTable headerTop borderBottom">
                          <table>
                              <caption>
                                  <c:out value='${appIntroduceInfo.questionType[i.index]}' />
                              </caption>
                              <thead>
                                  <tr>
                                      <th scope="col" class="LtextLeft">
                                          <label for="content_${i.index+1}">
                                              <c:out
                                                  value='${appIntroduceInfo.questionText[i.index]}' />
                                              <a href="javascript:;" onClick="writeGuidePopup();"
                                                  target="_blank" title="새 창"><span class="image"
                                                      data-src="btn_icon_question.png"
                                                      data-alt="자기소개서 작성 가이드"></span></a>
                                              <span class="wordNumbers">
                                                  <LTag:message code="app.lbl.charLength" /><span
                                                      id="chardata_${i.index+1}"> 0</span> / <c:if
                                                      test="${!empty appIntroduceInfo.minLength[i.index]}">
                                                      <c:out
                                                          value='${appIntroduceInfo.minLength[i.index]}' />
                                                      자 ~
                                                  </c:if>
                                                  <c:out
                                                      value='${appIntroduceInfo.maxLength[i.index]}' />
                                                  자
                                              </span>
                                          </label>
                                      </th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>
                                          <textarea id="content_${i.index+1}"
                                              name="content_${i.index+1}" class="LtextArea" <c:if
                                              test="${empty appIntroduceInfo.content[i.index]}"> placeholder="<c:out value='${appIntroduceInfo.guideText[i.index]}'/>" </c:if> ><c:out value='${appIntroduceInfo.content[i.index]}' /></textarea>
                                          <input type="hidden" class="minLength"
                                              id="minLength_${i.index+1}"
                                              name="minLength_${i.index+1}"
                                              value="<c:out value='${appIntroduceInfo.minLength[i.index]}' />" />
                                          <input type="hidden" class="maxLength"
                                              id="maxLength_${i.index+1}"
                                              name="maxLength_${i.index+1}"
                                              value="<c:out value='${appIntroduceInfo.maxLength[i.index]}' />" />
                                          <input type="hidden" id="questionText_${i.index+1}"
                                              value="<c:out value='${appIntroduceInfo.questionText[i.index]}' />" />
                                          <input type="hidden" id="guideText_${i.index+1}"
                                              value="<c:out value='${appIntroduceInfo.guideText[i.index]}' />" />
                                      </td>
                                  </tr>
                              </tbody>
                          </table>
                      </div>
                  </c:forEach>
          </form>
          <div class="LblockTabButton">
              <button type="button" class="btn_back" onclick="nextTab(this,<c:choose><c:when test="
                  ${jobNoticeInfo.careerTypeCode=='A' || jobNoticeInfo.careerTypeCode=='C' }">1
                  </c:when>
                  <c:otherwise>2</c:otherwise>
                  </c:choose>);"><span>
                      <LTag:message code="app.btn.back" />
                  </span>
              </button>
              <button type="button" id="btnSaveIntroInfo"><span>
                      <LTag:message code="com.btn.save" />
                  </span></button>
              <button type="button" onclick="nextTab(this,<c:choose><c:when test="
                  ${jobNoticeInfo.careerTypeCode=='A' || jobNoticeInfo.careerTypeCode=='C' }">3
                  </c:when>
                  <c:otherwise>4</c:otherwise>
                  </c:choose>);" ><span>
                      <LTag:message code="com.btn.next" />
                  </span>
              </button>
          </div>
      </div>

      <!-- Start : 제출 탭 -->
      <div id="LblockTabContent05" class="LblockTabContent">
      </div>
      <!-- End : 제출 탭 -->
      </c:if>
      </div>

      <%@include file="/WEB-INF/jsp/com/include/tail.jspf" %>
          </div><!-- End : LblockContent -->
          </div><!-- End : LblockContentGroup -->

          <%@include file="/WEB-INF/jsp/com/include/quick.jspf" %>
              </div><!-- End : LblockWrapper -->

</body>

</html>