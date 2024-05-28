import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us',
            style: TextStyle(
                color: Colors.blue[800], fontWeight: FontWeight.bold)),
        backgroundColor: Colors.grey[200],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/aboutus.avif'),
                SizedBox(height: 20),
                Text(
                  'About Us',
                  style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Empowering Your Digital Success',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to Seltn Solutions, where innovation meets expertise in the realm of Information Technology. In a world driven by digital transformation, we take pride in being your trusted partner on the journey to unparalleled success.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Who We Are:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'At Seltn Solutions, we are not just IT consultants; we are architects of possibilities, developers of dreams, and champions of your digital aspirations. With a relentless commitment to excellence, we bring a wealth of experience and a passion for cutting-edge solutions to the table.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Our Mission:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Empowering businesses through innovative IT solutions is at the core of our mission. We strive to be the driving force behind your success, leveraging the latest technologies to enhance efficiency, foster growth, and ensure a sustainable competitive advantage.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Why Choose Us:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  '1. Expertise that Matters:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Our team comprises seasoned professionals with a diverse skill set. From software development and system integration to IT consultation and beyond, we have the expertise to navigate the complex landscape of the digital world.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  '2. Tailored Solutions:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'We understand that every business is unique. That\'s why we don\'t believe in one-size-fits-all solutions. Our approach is personalized to meet your specific needs, ensuring a perfect fit for your goals and objectives.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  '3. Innovation as Standard:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Innovation is not just a buzzword for us; it\'s a way of life. We stay ahead of the curve, embracing the latest trends and technologies to deliver solutions that propel your business forward.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  '4. Client-Centric Focus:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Your success is our success. We prioritize building lasting relationships with our clients, working collaboratively to understand your challenges and goals, and crafting solutions that exceed expectations.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'What Sets Us Apart:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  '1. Results-Driven Approach:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'We are not just about delivering projects; we are about delivering results. Our focus is on tangible outcomes that elevate your business and set you apart in a competitive landscape.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  '2. Continuous Innovation:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'In the fast-evolving world of technology, stagnation is not an option. We are committed to continuous innovation, ensuring that your solutions are not only relevant today but also scalable for the challenges of tomorrow.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  '3. Transparency and Integrity:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'We believe in building trust through transparency. We keep you in the loop every step of the way, ensuring that you are always aware of the progress and the challenges. Our integrity is the cornerstone of our success.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  '4. Customer Satisfaction Guaranteed:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'We are not satisfied until you are. We go the extra mile to ensure that your experience with us is nothing short of exceptional. Our commitment to your satisfaction is unwavering.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Our Services:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '1. Software Development:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'We are your one-stop-shop for all your software development needs. From web and mobile apps to enterprise solutions and beyond, we have the expertise to bring your ideas to life.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  '2. System Integration:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'We help you streamline your business processes and enhance efficiency through seamless system integration. Our solutions are designed to optimize your operations and maximize your ROI.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  '3. IT Consultation:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'We are your trusted partner on the journey to digital transformation. Our team of experts is here to help you navigate the complex landscape of the digital world and make the right decisions for your business.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  '4. IT Infrastructure Management:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'We help you optimize your IT infrastructure to ensure a seamless experience for your customers and employees. Our solutions are designed to enhance efficiency, reduce costs, and improve productivity.',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
