import 'babel-polyfill';
import { sleep } from './common';
import axios from 'axios'

class MyPage {

  constructor() {
    this.jsAchieveHour = $('.js-achievements-hour');
    this.jsPaidLeavePlan = $('.js-paid-leave-plan');
    this.jsCurrentDate = $('.js-current-date');
    this.jsWorkTime = $('.js-reminning-work-time');
    this.jsWorkDay = $('.js-reminning-work-day');
  }

	async start() {
		console.log('start');
    this.jsAchieveHour.on('change', () => {
      this.getCalcResult();
    });
    this.jsPaidLeavePlan.on('change', () => {
      this.getCalcResult();
    });
		await sleep(2000);
		console.log('This page is nakanichi');
		console.log('end');
	}

  getCalcResult() {
    axios({
      method: 'get',
      url: '/api/calc',
      params: {
        seisan_hour: this.jsAchieveHour.val(),
        current_time: this.jsCurrentDate.text(),
        salaried: this.jsPaidLeavePlan.val()
      }
    })
    .then(res => {
      this.jsWorkTime.text(res.data.rest_hour);
      this.jsWorkDay.text(res.data.rest_workday);
    })
    .catch(err => {
      console.log(err);
    })
  }
}

document.addEventListener('DOMContentLoaded', () => {
	const myPage = new MyPage();
	myPage.start();
});