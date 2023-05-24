export const handler = async(event) => {
    console.log(event);
    // TODO implement
    const response = {
        statusCode: 200,
        body: JSON.stringify('Hello, Post method'),
    };
    return response;
};
