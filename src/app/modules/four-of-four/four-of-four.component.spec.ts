import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FourOfFourComponent } from './four-of-four.component';

describe('FourOfFourComponent', () => {
  let component: FourOfFourComponent;
  let fixture: ComponentFixture<FourOfFourComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FourOfFourComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FourOfFourComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
