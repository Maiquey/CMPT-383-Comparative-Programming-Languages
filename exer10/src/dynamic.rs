//finding zero area for Circle and Rectangles was both around 13 µs on average
//finding zero area for combined dynamic shapes was around 28 µs on average
//it would appear that the cost of dynamic dispatch in Rust is more than double that of method calls for which the type is known at compile time

pub trait Shape {
    fn area(&self) -> f64;
    fn description(&self) -> &str; // used to inspect types during testing
}

#[derive(Debug, Clone)]
pub struct Circle {
    radius: f64,
}
impl Circle {
    pub fn new(radius: f64) -> Circle {
        Circle { radius }
    }
    pub fn random() -> Circle {
        Circle {
            radius: rand::random::<f64>() + 1.0,
        }
    }
}
impl Shape for Circle {
    fn area(&self) -> f64 {
        std::f64::consts::PI * self.radius.powi(2)
    }
    fn description(&self) -> &str {
        "circle"
    }
}

#[derive(Debug, Clone)]
pub struct Rectangle {
    width: f64,
    height: f64,
}
impl Rectangle {
    pub fn new(width: f64, height: f64) -> Rectangle {
        Rectangle { width, height }
    }
    pub fn random() -> Rectangle {
        Rectangle {
            width: rand::random::<f64>() + 1.0,
            height: rand::random::<f64>() + 1.0,
        }
    }
}
impl Shape for Rectangle {
    fn area(&self) -> f64 {
        self.width * self.height
    }
    fn description(&self) -> &str {
        "rectangle"
    }
}

//take in a vector of shapes and decide if any of the shapes have an area of zero
pub fn any_circle_zero_area(shapes: &Vec<Box<Circle>>) -> bool {
    shapes.iter().fold(false, |acc, circle| acc || circle.area() == 0.0)
}
pub fn any_rectangle_zero_area(shapes: &Vec<Box<Rectangle>>) -> bool {
    shapes.iter().fold(false, |acc, rect| acc || rect.area() == 0.0)
}
pub fn any_shape_zero_area(shapes: &Vec<Box<dyn Shape>>) -> bool {
    shapes.iter().fold(false, |acc, shape| acc || shape.area() == 0.0)
}

// generate 2*n Circles
pub fn make_circle_vec(n: usize) -> Vec<Box<Circle>> {
    (0..2*n).map(|_| Box::new(Circle::random())).collect()    
}
// generate 2*n Rectangles
pub fn make_rectangle_vec(n: usize) -> Vec<Box<Rectangle>> {
    (0..2*n).map(|_| Box::new(Rectangle::random())).collect()  
}
// generate n Circles and n Rectangles
pub fn make_mixed_vec(n: usize) -> Vec<Box<dyn Shape>> {
    (0..2*n).map(|i| if i % 2 == 0 {Box::new(Circle::random()) as Box<dyn Shape>} else {Box::new(Rectangle::random()) as Box<dyn Shape>}).collect()
}