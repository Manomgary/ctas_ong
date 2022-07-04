import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BeneficiaireBlocComponent } from './beneficiaire-bloc.component';

describe('BeneficiaireBlocComponent', () => {
  let component: BeneficiaireBlocComponent;
  let fixture: ComponentFixture<BeneficiaireBlocComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BeneficiaireBlocComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BeneficiaireBlocComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
