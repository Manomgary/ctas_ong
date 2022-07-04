import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BeneficiairePrComponent } from './beneficiaire-pr.component';

describe('BeneficiairePrComponent', () => {
  let component: BeneficiairePrComponent;
  let fixture: ComponentFixture<BeneficiairePrComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BeneficiairePrComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BeneficiairePrComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
