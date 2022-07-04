import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-ida',
  templateUrl: './ida.component.html',
  styleUrls: ['./ida.component.scss']
})
export class IdaComponent implements OnInit {

  constructor(private router: Router) {
    /**if (router.getCurrentNavigation()?.extras.state) {
      console.log("current ===", router.getCurrentNavigation()?.extras.state)
    }*/
  }

  ngOnInit() {}
}
