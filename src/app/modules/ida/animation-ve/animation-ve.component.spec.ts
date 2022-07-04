import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AnimationVeComponent } from './animation-ve.component';

describe('AnimationVeComponent', () => {
  let component: AnimationVeComponent;
  let fixture: ComponentFixture<AnimationVeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AnimationVeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AnimationVeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
