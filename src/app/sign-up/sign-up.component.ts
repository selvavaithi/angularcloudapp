import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router'; 


@Component({
  selector: 'app-sign-up',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './sign-up.component.html',
  styleUrl: './sign-up.component.css'
})
export class SignUpComponent {

  user = { username: '', email: '', password: '' };

  constructor(private router: Router) { }

  onSubmit() {
    // Handle signup logic here (e.g., send data to backend)
    console.log('Signup data:', this.user);

    // Redirect to login or home page after successful signup
    this.router.navigate(['/login']); 
  }

}
