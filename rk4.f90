module rk4

        public ::  rk4_pausoa                           !RUNGE-KUTTA 4

contains

subroutine rk4_pausoa(x,y,f,h)

        use mcf_tipos

real(kind=dp), intent(inout)                :: x
real(kind=dp), dimension(:), intent(inout)  :: y
real(kind=dp), intent(in)    :: h

interface
   function f(x,y) result(yprima)
    use mcf_tipos
    real(kind=dp), intent(in)               :: x
    real(kind=dp), dimension(:), intent(in) :: y
    real(kind=dp), dimension(size(y))       :: yprima
   end function f
end interface

        real(kind=dp), dimension(size(y))           :: k1, k2, k3, k4

        k1 = h * f(x,y)                        ! Lehen pausua
        k2 = h * f(x+0.5_dp*h , y+0.5_dp*k1)   ! Erdiko puntua
        k3 = h * f(x+0.5_dp*h , y+0.5_dp*k2)   ! Berriro erdiko puntua
        k4 = h * f(x+h , y+k3)                 ! Tartearen bukaerako puntua

        x = x + h
        y = y + (k1 + 2*k2 + 2*k3 +k4) / 6.0_dp    ! pausu osoa

end subroutine rk4_pausoa

end module rk4
