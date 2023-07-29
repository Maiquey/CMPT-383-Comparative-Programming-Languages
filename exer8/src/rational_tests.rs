#[cfg(test)]
use crate::rational::Rational;

#[test]
fn rational_test() {
    let mut r = Rational::new(6, 8);
    assert_eq!(format!("{:?}", r), "Rational { n: 6, d: 8 }");
    r.reduce();
    assert_eq!(format!("{:?}", r), "Rational { n: 3, d: 4 }");
    let four1 = Rational::from(4);
    let four2 = Rational::new(4, 1);
    assert_eq!(four1, four2);
}

#[test]
fn rational_display_test() {
    let display_rational = Rational::new(4, 7);
    assert_eq!(format!("{}", display_rational), "4/7");
    let display_rational = Rational::new(3, 4);
    assert_eq!(format!("{}", display_rational), "3/4");
    let display_rational = Rational::new(-6, 8);
    assert_eq!(format!("{}", display_rational), "-6/8");
}

#[test]
fn rational_float_test() {
    let r = Rational::new(1, 8);
    let f1 = f64::from(r.clone());
    let f2: f64 = r.into();
    assert_eq!(f1, f2);
    assert_eq!(f1, 0.125);
    assert_eq!(f2, 0.125);
}