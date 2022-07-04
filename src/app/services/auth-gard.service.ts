import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthGardService implements CanActivate {
  isConnexion: boolean = false;
  constructor(
    private router: Router
  ) {
    setTimeout(() => {
      this.isConnexion = true
    });
  }
  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean | Observable<boolean> | Promise<boolean> {
    // Si l'utilisateur est connecter
    if (this.isConnexion) {
      // si l'utilisateur est connecter
      return true;
    } else {
      // si l'utilisateur n'est pas connecter, on va rédiriger vers la page de connexion
      this.router.navigate(['/login']);
      return false;
    }
  }
}
