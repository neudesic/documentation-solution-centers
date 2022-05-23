# TypeScript React Concepts and Resources

1. [What is React?](#React)
   - [Example](#example1)
   - [Resources](#resource1)
2. [TypeScript](#Typescript)
   - [Example](#example2)
   - [Resources](#resource2)
3. [HTML DOM](#Html-Dom)
   - [Resources](#resource3)
4. [React Elements](#React-Elements)
   - [Example](#example4)
   - [Resources](#resource4)
5. [Components](#Components)
   - [Resources](#resource5)
6. [Props](#Props)
   - [Example](#example6)
   - [Resources](#resource6)
7. [State](#state)
   - [Example](#example7)
   - [Resources](#resource7)
8. [Re-Render and the Virtual DOM](#Re-Renders)
   - [Resources](#resource8)
9. [Styled Components](#Styled-Components)
   - [Example](#example9)
   - [Resources](#resource9)
10. [Solution Center Best Practices](#Styled-Components)
    - [Resources](#resource10)

---

## **What is React?** <a name="React"></a>

React is a popular Javascript library used for the rapid creation of user interfaces with the use of stateful components. React is used to build single page applications while creating reusable UI components. React is a [declarative](https://www.techtarget.com/searchitoperations/definition/declarative-programming) programming library in which we represent how we want our page to look like though the use of JSX Elements. [JSX](https://reactjs.org/docs/introducing-jsx.html) is an HTML-like syntax we use to create HTML elements in react.

### **Example** <a name="example1"></a>

The code snippet below depectics a very basic example of a 'Hello World' component in react and how to inject a react element into an html element with the id of 'root'.

```javascript
export const HelloWorld = () => {
    return (
        <p>Hello World!</p> // JSX Element example. Creates an HTML equivalent to the <p> element.
    )
};

const root = ReactDOM.createRoot(document.getElementById("root") as HTMLElement);
root.render(<HelloWorld/>);
```

### **Resources** <a name="resource1"></a>

[React Course - Pluralsight](https://www.pluralsight.com/paths/building-web-applications-with-react?utm_term=&b2c-coursesaid=7014Q000002GbBEQA0&promo=&oid=&utm_source=non_branded&utm_medium=digital_paid_search_google&utm_campaign=US_Courses_ReactJS&utm_content=&utm_term=16728664951&gclid=Cj0KCQjwvqeUBhCBARIsAOdt45aedoImo2KttBKHJDYO-QEUNVO5i5Zkz-UnzAIrweJincVMKSprPZkaAgaOEALw_wcB)

[React Documentation - Published By Facebook Open Source](https://reactjs.org/)

[Free Youtube Course TBD](https://www.youtube.com/)

---

## **What is TypeScript?** <a name="Typescript"></a>

TypeScript is a strongly typed language built on top of JavaScript. It benefits developers in many ways, such as; catching errors at compile-time, providing documentation and autocompletion, allowing for a robust set of configuration rules, and making refactoring code a lot easier.

### **Example** <a name="example2"></a>

```TypeScript
// JavaScript Example
let str = 'Not A Strongly Typed';
str = 5; // I can do this with absolutely no reprocussions.

// TypeScript Example
let str: string = 'Strongly Typed String!';
str = 5; // Error: Type 'number' is not assignable to type 'string'.(2322)
```

Below represents a basic example of how to declare a type and use it within TypeScript.

```TypeScript
type Person = {
  firstName: string;
  lastName: string;
  age: number;
  phoneNumber: string;
  address: string;
};

const me: Person = { firstName: 'John', lastName: 'Smith', age: 25, phoneNumber: '123-457-7891', address '123 Developer Road' };

```

### **Resources** <a name="resource2"></a>

[TypeScript Documentation - Published By Microsoft](https://www.typescriptlang.org/)

[TypeScript - Pluralsight Course](https://www.pluralsight.com/courses/typescript?exp=3)

[TypeScript - The Basics Video - By Fireship](https://www.youtube.com/watch?v=ahCwqrYpIuM&t=2s)

---

## **The HTML DOM** <a name="Html-Dom"></a>

The HTML DOM (**D**ocument **O**bject **M**odel), is the browser's object tree representation of an html page. You are able to leverage JavaScript to manipulate the HTML DOM and change what is displayed on the page, but direct HTML DOM manipulation is very slow in nature and this is one of the problems that React solves utilizing its 'Virtual-DOM'.

<img src="https://raw.githubusercontent.com/10Pines/ghost-storage/master/2018/08/Arbol.png" />

### **Example** <a name="example3"></a>

**Index.html**

```
<!doctype html>
<html lang="en">
   <head>
      <script src="index.js"></script>
   </head>
   <body>
      <div id="my-id-element"></div> <!-- Element1 -->
      <div id="my-class-element"></div> <!-- Element2 -->
      <div id="my-class-element"></div> <!-- Element3 -->
   </body>
</html>
```

**Index.js**

```
// How to interact with the DOM API in JavaScript/TypeScript
let idElement = document.getElementById('my-id-element'); // Returns the HTML Element object tied to 'Element1'
let classElements = document.getElementsByClassName('my-class-elements'); // Returns an HTMLCollection of HTML Element objects 'Element2' & 'Element3'

// We can directly change the values of these elements
idElement.innerText = 'Hello World!' // Upon execution of this command, the string 'Hello World!' would be rendered inside of Element1
```

### **Resources** <a name="resource3"></a>

['What is the DOM?' - Aaron Jack](https://www.youtube.com/watch?v=KShnPYN-voI&ab_channel=AaronJack)

[HTML DOM Documentation](https://www.w3schools.com/js/js_htmldom.asp)

---

## **What are React Elements?** <a name="React-Elements"></a>

Elements are the smallest bulding blocks of a React application. They are created by using JSX, an HTML-like syntax. We define our elements using JSX and React uses that to create HTMLElement objects. Then React uses those HTMLElement objects to sync with the HTML DOM.

### **Example** <a name="example4"></a>

```TypeScript

const myElement = <div id="my-id" className="class-name" onClick={() => {}}>I am a div element!</div>

```

### **Resources** <a name="resource4"></a>

[React Elements](https://reactjs.org/docs/rendering-elements.html#:~:text=Elements%20are%20the%20smallest%20building,and%20are%20cheap%20to%20create.)

---

## **What are Components?** <a name="Components"></a>

Functional Components are reusable bits of code that combine elements and logic to serve as a larger building block of an application. We can combine, props, state, and other lifecycle hooks to create a dynamic UI experience. Functional components take in data and return elements. There are two ways to create components, functional components and class components. [Class components](https://www.w3schools.com/react/react_class.asp) are the legacy way of building components and are slowly becoming deprecated and out of date. Functional components are the new and improved way of creating components and how we primarily write React code in the Solution Center.

### **Resources** <a name="resource5"></a>
[React Components](https://reactjs.org/docs/components-and-props.html)

---

## **What are Props?** <a name="Props"></a>

Props, shorthand for 'properties', are objects in react that can be passed down or used to render data in components. You can pass down any type of data into props including functions. This allows us to pass data down from parent components to children sub-components and utilize that data.

### **Example** <a name="example6"></a>

```TypeScript
const ExampleComponentWithProps = (props) => {
   return (
         <>
            <p>Hello, {props.name}!</p>
         </>
      )
}

const root = ReactDOM.createRoot(document.getElementById("root") as HTMLElement);
root.render(<ExampleComponentWithProps name="John Smith"/>); //
```


### **Resources** <a name="resource6"></a>

[Components and Props](https://reactjs.org/docs/components-and-props.html)

---

## **What is State?** <a name="State"></a>

State is a built in lifecycle feature that allows developers to keep track of certian data and when that data changes it causes react to trigger a re-render.

### **Example** <a name="example7"></a>

```TypeScript
const ExampleComponentWithStateHook = () => {
   const [count, setCount] = useState(0); // Declare a state variable and it initialize with 0.

   return (
         <>
            <p>Count: {count}</p>
            <button onClick={() => { setCount(count + 1) }}>Increment</button>
         </>
      )
}
```

### **Resources** <a name="resource7"></a>

[React State Hook](https://reactjs.org/docs/hooks-state.html)

---

## **Re-Render and the Virtual DOM** <a name="Re-Renders"></a>

The Virtual DOM is a faster in memory representation of the HTML DOM. We declare to the Virtual DOM what we want it to look like and under the hood the Virtual DOM waits for state changes and then efficiently syncs up with the HTML DOM and re-renders the page. This re-render process is called [Reconciliation](https://reactjs.org/docs/reconciliation.html).

### **Resources** <a name="resource8"></a>

[Understanding React's Virtual DOM](https://reactjs.org/docs/faq-internals.html)

---

## **Styled-Components** <a name="Styled-Components"></a>

Styled-Components is a library for React and Reactive Native that allows you to create component-level styles utilizing a technique called css-in-js. Styled-Components also allows developers to create multiple themes and pass the active theme down in a context-like fashion.

### **Example** <a name="example9"></a>

```Typescript
const Button = styled.button`
  font-size: 1em;
  margin: 1em;
  padding: 0.25em 1em;
  border-radius: 3px;

  /* Color the border and text with theme.main */
  color: ${props => props.theme.main};
  border: 2px solid ${props => props.theme.main};
`;
```

### **Resources** <a name="resource9"></a>

[Styled Components Video](https://www.youtube.com/watch?v=-FZzPHSLauc&ab_channel=PedroTech)

[Styled Components Documentation](https://styled-components.com/docs/basics)

---

## **Solution Center Best Practices** <a name="Best-Practices"></a>

The [React Style Guide](https://github.com/neudesic/react-storybook/wiki/React-Style-Guide) is a document that outlines our Solution Center best practices. This is currently a work in progress document that will continue to be iterated on and expanded.
