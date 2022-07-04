import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MepCepComponent } from './mep-cep.component';

describe('MepCepComponent', () => {
  let component: MepCepComponent;
  let fixture: ComponentFixture<MepCepComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MepCepComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MepCepComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
