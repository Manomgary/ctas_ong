import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MepBlocComponent } from './mep-bloc.component';

describe('MepBlocComponent', () => {
  let component: MepBlocComponent;
  let fixture: ComponentFixture<MepBlocComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MepBlocComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MepBlocComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
